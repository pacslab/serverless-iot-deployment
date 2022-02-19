def factorial(n):
    result = 1
    for i in range(1, n + 1):
        result *= i
    return result


def handler(event, context):
    factorial(10000)
    return {
        'statusCode': 200,
        'body': "'dummy fac'"
    }
