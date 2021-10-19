import json
from io import BytesIO
import uuid
import joblib
import numpy as np
from PIL import Image
from skimage.feature import hog
from skimage.color import rgb2gray
import os
import mysql.connector
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


# mydb = mysql.connector.connect(
#   host=os.environ.get("database-images.chtf1hopc7q1.ca-central-1.rds.amazonaws.com"),
#   user=os.environ.get("user"),
#   password='password',
#   database="cat"
# )


def commitData(requestId, prediction):
  mycursor = mydb.cursor()

  sql = "INSERT INTO prediction (requestId, prediction) VALUES (%s, %s)"
  val = (requestId, prediction)
  mycursor.execute(sql, val)

  mydb.commit()


def handler(event, context):
    #get image
    print(event)
    body = json.loads(event['body'])
    data = body['fileContents']
    #image = data['file']
    #print(data['name'])

    #image = image[image.find(",") + 1:]
    dec = base64.b64decode(data)
    label = {0: 'Cat', 1: 'Dog'}
    buff = BytesIO()
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
    id = str(uuid.uuid1())

    # persist
    # commitData(id, result)

    return {
        'prediction': result,
    }
