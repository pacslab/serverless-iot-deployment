#
# gg-webserver
#
import json
import joblib
import numpy as np
from PIL import Image
from hog import hog
from colorconv import rgb2gray
import base64
import greengrasssdk
import logging
from io import BytesIO
from http.server import HTTPServer, BaseHTTPRequestHandler

PORT = 4711

logging.basicConfig(format='%(asctime)s %(levelname)s: %(filename)s:%(lineno)s - %(funcName)s: %(message)s')
logger = logging.getLogger()
logger.setLevel(logging.INFO)

class RequestHandler(BaseHTTPRequestHandler):


    def do_POST(self):
        content_length = int(self.headers['Content-Length'])
        body = self.rfile.read(content_length)
        logger.info(
            "POST request: Path: {}\nHeaders: {}\nBody: {}".format(self.path, self.headers, body.decode('utf-8')))

        # get image
        message = json.loads(body)
        data = message['fileContents']

        dec = base64.b64decode(data)
        label = {0: 'Cat', 1: 'Dog'}
        img = Image.open(BytesIO(dec))

        # resize
        img = img.resize((56, 56), Image.ANTIALIAS)

        img_arr = np.array(img)
        # flatten three channel color image
        color_features = img_arr.flatten()
        # convert image to greyscale
        grey_image = rgb2gray(img_arr)
        # get HOG features from greyscale image
        hog_features = hog(grey_image, block_norm='L2-Hys', pixels_per_cell=(8, 8))
        # combine color and hog features into a single array
        flat_features = np.hstack((color_features, hog_features))

        # model
        svm = joblib.load('svm_model.sav')
        prediction = svm.predict([flat_features])
        print("Prediction: " + label[prediction[0]])
        result = int(prediction[0])

        self.send_response(200)
        self.end_headers()

        self.wfile.write(json.dumps({'prediction': result}).encode('utf-8'))


logger.info("creating greengrass client")
c_gg = greengrasssdk.client('iot-data')

webserver = HTTPServer(('', 4711), RequestHandler)
logger.info("starting HTTP server")
webserver.serve_forever()


# This is a dummy handler and will not be invoked
def function_handler(event, context):
    print("event: {}".format(event))
    return
