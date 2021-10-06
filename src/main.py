from process_input import process
from resize import *
import time


def main():
    # print("\nResizing images")
    # resizeAllCats()
    # resizeAllDogs()
    # print("\nTraining model")
    # dog_features = create_features('resize/dataset_1/training_set/cats/cat.2718.jpg')
    # svm = create_feature_matrix()

    print("\nTest:")
    destination = 'dataset_1/test_set/resize/dog.51.jpg'
    path = '../dataset_1/test_set/dog.51.jpg'
    resize(path, destination)
    process('../dataset_1/test_set/resize/dog.51.jpg')

# Run Main
if __name__ == "__main__":
    start_time = time.time()
    main()
    print("--- %s seconds ---" % (time.time() - start_time))
