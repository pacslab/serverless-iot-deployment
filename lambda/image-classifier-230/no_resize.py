import base64
from io import BytesIO
import numpy as np
from skimage.feature import hog
from skimage.color import rgb2gray
import skimage.io

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

    img = open("image.jpg")

    img_arr = np.array(img)
    # flatten three channel color image
    color_features = img_arr.flatten()
    # convert image to greyscale
    grey_image = rgb2gray(img_arr)
    # get HOG features from greyscale image
    hog_features = hog(grey_image, block_norm='L2-Hys', pixels_per_cell=(8, 8))
    # combine color and hog features into a single array
    flat_features = np.hstack((color_features, hog_features))
    # feature
    test_features = create_features_from_image(6)

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
