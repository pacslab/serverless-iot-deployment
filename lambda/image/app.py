import json
from io import BytesIO
import uuid
import joblib
import numpy as np
from PIL import Image
from skimage.feature import hog
from skimage.color import rgb2gray
import base64


def create_features_from_image(image):
    img_arr = np.array(image)
    # flatten three channel color image
    color_features = img_arr.flatten()
    # convert image to greyscale
    grey_image = rgb2gray(img_arr)
    # get HOG features from greyscale image
    hog_features = hog(grey_image, block_norm='L2-Hys', pixels_per_cell=(8, 8))
    # combine color and hog features into a single array
    flat_features = np.hstack((color_features, hog_features))
    return flat_features


def create_features(path):
    img = Image.open(path)
    return create_features_from_image(img)


def handler(event, context):
    #get image
    print(event)
    body = json.loads(event['body'])
    data = body['fileContents']

    dec = base64.b64decode(data)
    label = {0: 'Cat', 1: 'Dog'}
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

    return {
        'statusCode': 200,
        'headers': {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*'
        },
        'body': json.dumps({
            'prediction': result
        }),
        "isBase64Encoded": False
    }
