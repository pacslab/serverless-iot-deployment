# set base image (host OS)
FROM python:3.9

# set the working directory in the container
WORKDIR /code

ENV FLASK_APP=app.py

# copy the dependencies file to the working directory
COPY src/requirements.txt .

# install dependencies
RUN pip install -r requirements.txt

# copy the content of the local src directory to the working directory
COPY src/ .

EXPOSE 5000

# command to run on container start
CMD [ "python", "./app.py" ]