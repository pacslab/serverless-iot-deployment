from resize import resizeAllCats
import time


def main():
    print("\nResizing images")
    resizeAllCats()

# Run Main
if __name__ == "__main__":
    start_time = time.time()
    main()
    print("--- %s seconds ---" % (time.time() - start_time))
