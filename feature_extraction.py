import numpy as np
from PIL import Image
from skimage.feature import hog
from skimage.color import rgb2gray


def create_features_from_image(image):
    img_arr = np.array(image)
    # flatten three channel color image
    color_features = img_arr.flatten()
    # convert image to greyscale
    grey_image = rgb2gray(img_arr)
    # get HOG features from greyscale image
    hog_features = hog(grey_image, block_norm='L2-Hys', pixels_per_cell=(8, 8))
    # combine color and hog features into a single array
    flat_features = np.hstack((color_features, hog_features))
    return flat_features


def create_features(path):
    img = Image.open(path)
    return create_features_from_image(img)

