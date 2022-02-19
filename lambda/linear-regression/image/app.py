import json
from scipy import stats
import numpy as np

def handler(event, context):

    x = np.random.random(10)
    y = np.random.random(10)
    slope, intercept, r_value, p_value, std_err = stats.linregress(x, y)

    response = {
        "statusCode": 200,
        "body": json.dumps("linregres")
    }

    return response