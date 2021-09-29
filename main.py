from feature_extraction import create_features
from resize import *
import time


def main():
    # print("\nResizing images")
    # resizeAllCats()
    # resizeAllDogs()
    print("\nTraining model")
    # create_features()


# Run Main
if __name__ == "__main__":
    start_time = time.time()
    main()
    print("--- %s seconds ---" % (time.time() - start_time))
