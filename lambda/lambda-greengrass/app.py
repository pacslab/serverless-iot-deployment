import json
from io import BytesIO
import joblib
import boto3
import numpy as np
from PIL import Image
from hog import hog
from colorconv import rgb2gray
import base64

s3 = boto3.resource('s3')
bucket_name = 'new-s3-us'
file_path = 'svm_model.sav'
MODEL_LOCAL_PATH = '/tmp/' + file_path


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


def lambda_handler(event, context):
    try:
        svm = joblib.load(MODEL_LOCAL_PATH)
    except:
        s3.Bucket(bucket_name).download_file(file_path, MODEL_LOCAL_PATH)
        svm = joblib.load(MODEL_LOCAL_PATH)

    # get image
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
    prediction = svm.predict([test_features])
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
