# set base image (host OS)
FROM public.ecr.aws/lambda/nodejs:14
# Copy function code
COPY index.js lena.jpeg  ${LAMBDA_TASK_ROOT}

# Install NPM dependencies for function
RUN npm install --arch=x64 --platform=linux gulp-imagemin jspdf html-pdf natural office-text-extractor jimp

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "index.handler" ]
