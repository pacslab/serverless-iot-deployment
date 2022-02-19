import glob

from PIL import Image

def resizeAllCats():
    source ='dataset_1/training_set/cats/'
    destination = 'resize/'
    for filename in glob.glob(source+'*.jpg'):
        resize(filename, destination+filename)

def resizeAllDogs():
    source ='dataset_1/training_set/dogs/'
    destination = 'resize/'
    for filename in glob.glob(source+'*.jpg'):
        resize(filename, destination+filename)

def resize(source, destination):
    img = Image.open(source)
    img = img.resize((56, 56), Image.ANTIALIAS)
    img.save(destination)