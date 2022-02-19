import base64
from io import BytesIO

import joblib
from PIL import Image
from flask import Flask, jsonify, request, Response
from flask_cors import cross_origin

from feature_extraction import create_features_from_image

app = Flask(__name__, static_url_path='')


@app.get('/')
@cross_origin()
def index():
    return jsonify({
        'msg': 'ML microservice'
    })


@app.post('/ml/predict/')
@cross_origin()
def predict():
    label = {0: 'Cat', 1: 'Dog'}
    data = request.json
    imageCoded64 = data.get('fileContents', '')
    dec = base64.b64decode(imageCoded64)

    img = Image.open(BytesIO(dec))

    # resize
    img = img.resize((56, 56), Image.ANTIALIAS)

    # feature
    test_features = create_features_from_image(img)

    # model
    svm = joblib.load('svm_model.sav')
    prediction = svm.predict([test_features])
    print("Prediction: " + label[prediction[0]])
    result = int(prediction[0])

    return jsonify({
        'prediction': result
    })


# Run Main
if __name__ == "__main__":
    app.run(host='0.0.0.0')
