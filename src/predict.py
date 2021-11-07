from pytorch_tabnet.tab_model import TabNetClassifier

import torch
from sklearn.preprocessing import LabelEncoder
from sklearn.metrics import accuracy_score
from sklearn.model_selection import train_test_split
import pandas as pd
import numpy as np
np.random.seed(0)

target = "Result"

cat_columns = [
    "Wellbeing", "SiteDisease", "Appetite", "Above100F", "Vomit", "LiquidStools", "Diarrhea", 
    "BowelMovements", "Arthritis", "Skin", "Eye", "AbdominalPain", "Pain", "PainAwake", 
    "AbdominalMass", "AbdominalTenderness", "Fissure", "Blood"
]

int_columns = ["BodyWeight", "AvgTemp"]

feature_columns = (int_columns + cat_columns + [target])

# Read dataset

train  = pd.read_csv('data.csv')
n_total = len(train)

# Train Test Split

train_val_indices, test_indices = train_test_split(range(n_total), test_size=0.2, random_state=0)
train_indices, valid_indices = train_test_split(train_val_indices, test_size=0.2 / 0.6, random_state=0)

# Label encode categorical column

categorical_columns = []
categorical_dims =  {} # unique values
for col in train.columns[train.dtypes == object]:
    print(col, train[col].nunique())
    l_enc = LabelEncoder()
    train[col] = l_enc.fit_transform(train[col].values)
    categorical_columns.append(col)
    categorical_dims[col] = len(l_enc.classes_)
    
unused_feat = []

features = [ col for col in train.columns if col not in unused_feat+[target]] 

cat_idxs = [ i for i, f in enumerate(features) if f in categorical_columns]

cat_dims = [ categorical_dims[f] for i, f in enumerate(features) if f in categorical_columns]

clf = TabNetClassifier(
    n_d=64, n_a=64, n_steps=5,
    gamma=1.5, n_independent=2, n_shared=2,
    cat_idxs=cat_idxs,
    cat_dims=cat_dims,
    cat_emb_dim=1,
    lambda_sparse=1e-4, momentum=0.3, clip_value=2.,
    optimizer_fn=torch.optim.Adam,
    optimizer_params=dict(lr=2e-2),
    scheduler_params = {"gamma": 0.95,
                     "step_size": 20},
    scheduler_fn=torch.optim.lr_scheduler.StepLR, epsilon=1e-15
)

X_train = train[features].values[train_indices]
y_train = train[target].values[train_indices]

X_valid = train[features].values[valid_indices]
y_valid = train[target].values[valid_indices]

X_test = train[features].values[test_indices]
y_test = train[target].values[test_indices]

# Train TabNet Classifier

clf.fit(
    X_train=X_train, y_train=y_train,
    eval_set=[(X_train, y_train), (X_valid, y_valid)],
    eval_name=['train', 'valid'],
    max_epochs=100, patience=100,
    batch_size=16384, virtual_batch_size=256,
    drop_last=False
)

# Do Inference
# We encounter some problem while using 'save_model' method of TabNet's 
# Therefore decided to directly expose predict function

def getPredict(dictionary):
    newTest = pd.DataFrame.from_dict(dictionary, orient="index").T
    newTest = newTest[["Wellbeing", "SiteDisease", "Bodyweight", "Appetite", "AvgTemp",
                "Above100F", "Vomit", "LiquidStools", "Diarrhea", "BowelMovements",
                "Arthritis", "Skin", "Eye", "AbdominalPain", "Pain", "PainAwake", "AbdominalMass",
                "AbdominalTenderness", "Fissure", "Blood"]]
    xyz = pd.read_csv("data.csv")
    xyz = xyz.drop("Result", axis=1)
    new_pred = []
    temp = list()
    for i in xyz.columns:
        temp.append(i)
        edc = xyz[i].unique()
        test = [newTest.loc[0][temp.index(i)]]
        label_enc = LabelEncoder()
        tr = label_enc.fit(edc).transform(test)
        new_pred.append(int(tr))
        if temp.index(i) == 2:
            new_pred[2] = newTest.loc[0][2]
        elif temp.index(i) == 4:
            new_pred[4] = newTest.loc[0][4]
    final = l_enc.inverse_transform(clf.predict([np.asarray(new_pred)]))
    return final[0]

