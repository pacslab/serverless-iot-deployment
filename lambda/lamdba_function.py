import json
import joblib
import boto3
from io import BytesIO

# loads model from s3
s3 = boto3.client('s3')
data = s3.get_object(Bucket='images-s3', Key ='svm_model.sav')
contents = data['Body'].read()

print(type(contents))

svm = joblib.load(BytesIO(contents))


def lambda_handler(event, context):
    # TODO implement

    return {
        'statusCode': 400,
        'body': json.dumps('working!')
    }
