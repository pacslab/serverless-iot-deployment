import json
from io import BytesIO
import uuid

import joblib
from PIL import Image
from flask import Flask, jsonify, request, Response
from flask_cors import cross_origin

from feature_extraction import create_features_from_image
from insert_db import commitData

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

    # read image
    file = request.files['file']
    if not file.filename:
        return Response(json.dumps({'message': 'image not found'}))
    buff = BytesIO()
    file.save(buff)
    img = Image.open(file)

    # resize
    img = img.resize((56, 56), Image.ANTIALIAS)

    # feature
    test_features = create_features_from_image(img)

    # model
    svm = joblib.load('svm_model.sav')
    prediction = svm.predict([test_features])
    print("Prediction: " + label[prediction[0]])
    result = int(prediction[0])
    id = str(uuid.uuid1())

    # persist
    commitData(id, result)

    return jsonify({
        'prediction': result
    })


# Run Main
if __name__ == "__main__":
    app.run(host='0.0.0.0')
