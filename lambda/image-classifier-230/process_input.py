import joblib

from feature_extraction import create_features


def process(path):
    label = {0: 'Cat', 1: 'Dog'}
    test_features = create_features(path)
    svm = joblib.load('../model/svm_model.sav')
    prediction = svm.predict([test_features])
    print("Prediction: " + label[prediction[0]])
