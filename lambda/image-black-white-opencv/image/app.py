import json
import base64
from io import BytesIO
import cv2
from PIL import Image

def handler(event, context):

    # get image
    body = json.loads(event['body'])
    data = body['fileContents']
    dec = base64.b64decode(data)
    image = Image.open(BytesIO(dec))

    # load the image
    img = cv2.imread("image.jpg")
    grayImage = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)


    response = {
        "statusCode": 200,
        "body": json.dumps("ok")
    }

    return response