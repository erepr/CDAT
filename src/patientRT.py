import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

from score import getScore
from predict import getPredict

# Use a service account
cred = credentials.Certificate('patient_keys/crohns-96271-firebase-adminsdk-362y7-5005b8cf91.json')
firebase_admin.initialize_app(cred)

db = firestore.client()

import threading

callback_done = threading.Event()

def on_snapshot(doc_snapshot, changes, read_time):
    for doc in doc_snapshot:
        temp = db.collection(u'Patient').document(doc.id).get().to_dict()
        data = {
            u'Score': getScore(temp),
            u'Severity': getPredict(temp),
            u'Timestamp': temp['Timestamp']
            }
        db.collection(u'History').document(doc.id).set(data) # send predictions to database
        
    callback_done.set()

doc_ref = db.collection(u'Patient')

doc_watch = doc_ref.on_snapshot(on_snapshot)
