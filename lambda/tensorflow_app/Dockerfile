# set base image (host OS)
FROM public.ecr.aws/lambda/python:3.7

# set the working directory in the container
WORKDIR /code

# Copy function code
COPY image/app.py ${LAMBDA_TASK_ROOT}

# copy the dependencies file to the working directory
COPY image/requirements.txt .

# install dependencies
RUN pip install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"

# copy the content of the local src directory to the working directory
COPY image/ .

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "app.handler" ]