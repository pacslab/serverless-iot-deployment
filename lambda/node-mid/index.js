const sharp = require('sharp');
const path = require('path');

var AWS = require('aws-sdk');

'use strict'

const natural = require('natural')
const classifier = new natural.BayesClassifier()


// This Lambda function is attached to an S3 bucket. When any object is added in the S3
// busker this handler will be called. This Lambda function "assumes" that only image files
// are added in the S3 bucket. When an image file is added in the S3 bucket, this function
// creates a square thumbnail of 300px x 300px size and it also creates a cover photo of
// 800px x 800px size. It then stores the thumbnail and coverphotos back to the same S3 bucket
// at the same location as the original image file.
exports.handler = async function(event, context) {



    console.log("start");

    classifier.addDocument('my unit-tests failed.', 'software')
    classifier.addDocument('tried the program, but it was buggy.', 'software')
    classifier.addDocument('the drive has a 2TB capacity.', 'hardware')
    classifier.addDocument('i need a new power supply.', 'hardware')

    classifier.train()

    console.log(classifier.classify('did the tests pass?'))
    console.log(classifier.classify('did you buy a new drive?'))
    // Use sharp to create a 300px x 300px thumbnail
    // withMetadata() keeps the header info so rendering engine can read
    // orientation properly.
    var resizePromise1 = sharp("lena.jpeg")
                        .resize({
                            width: 300,
                            height: 300,
                            fit: sharp.fit.cover
                        })
                        .withMetadata()
                        .toBuffer();


    console.log("Finished");
    return {
        statusCode: 200,
        body: JSON.stringify('node!'),
    };


}
