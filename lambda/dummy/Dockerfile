# set base image (host OS)
FROM public.ecr.aws/lambda/python:3.8

# set the working directory in the container
WORKDIR /code

# Copy function code
COPY app.py ${LAMBDA_TASK_ROOT}

# copy the dependencies file to the working directory
COPY requirements.txt .

# install dependencies
RUN pip install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "app.handler" ]