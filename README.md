![Crohn's Disease Activity Tracker!](/img/logo.png)
# Crohn's Disease Activity Tracker
#### Manage your Crohn's Disease Flareup. Track your daily protocol.


#### Releases

+ Crohn's Disease Activity Tracker for Patients [CDAT Tracker](https://appdistribution.firebase.google.com/pub/i/32c146ddb4034129) | [APK](https://github.com/erepr/CDAT/blob/main/APK/Crohn%20Tracker.apk)  
+ For Gastoenterologists [CDAT Doctor](https://appdistribution.firebase.google.com/pub/i/af791d4fbee5b3bf) | [APK](https://github.com/erepr/CDAT/blob/main/APK/CDAT%20Doctor.apk) 
+ Offline [Both](https://drive.google.com/drive/folders/1TdHXva7pBXtE1Cl5Vuy4FzqT389nFRl2?usp=sharing)
+ [Slides](https://github.com/erepr/CDAT/blob/main/Slides/CDAT.pdf)

#### Source code

If you wan to use it locally:  

+ `git clone git@github.com:erepr/CDAT.git`
+ `cd CDAT\src` to get inside the repository
+ `python3 predictRT.py` capture live changes to firebase

## Doctor's App

- Our mobile application allows eminent **Gastroenterologist** to provide input data from every visited patient who has been diagnosed with Crohn's Disease.

- Labelling of symptoms can only done by **Gastroenterologists**.


<img src="https://i.imgur.com/14GIoP8.jpg" width="230">&nbsp; &nbsp; &nbsp; &nbsp;<img src="https://i.imgur.com/s6Xcm5d.jpg" width="230"> &nbsp; &nbsp; &nbsp; &nbsp;<img src="https://i.imgur.com/5wrtbhv.jpg" width="230"> 


## Patient App

- A TabNet Classifier model is trained with this input data upon which an inference is made from patients input data.

- Prediction is made on the patients symptoms data, and thereby initiate them to take timely medical assistance.

- Disease severity is classified as: very well, fair to good, poor and very poor.

- A severity score is computed which ranges from **100 to 450**. Those **below 100** are classified as doing **very well**, between **100 to 200** as **Fair to Good** and those **above 200** as doing **very poor**.


<img src="https://i.imgur.com/LxQS91l.jpg" width="300">&nbsp; &nbsp; &nbsp; &nbsp;<img src="https://i.imgur.com/lAwHvHZ.jpg" width="300"> 

## Useful links

+ Best WR, Becktel JM, Singleton JW, Kern F Jr. Development of a Crohn's disease activity index. National Cooperative Crohn's Disease Study. Gastroenterology. 1976 Mar;70(3):439-44. PMID: 1248701.  [Development of a Crohn's disease activity index](https://doi.org/10.1016/S0016-5085(76)80163-1)

## Flutter

+ Before running your project make sure you run the following command  
  + `flutter pub get`  
  + `flutter packages pub run build_runner build --delete-conflicting-outputs`  
  + This creates the generated code necessary for the project to compile  

+ You can find Firebase Firestore schema at 
  + For doctor `Flutter\doctor\lib\backend\schema` 
  + For patient `Flutter\patient\lib\backend\schema` 
