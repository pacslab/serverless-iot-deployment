import numpy as np
import pandas as pd
from torchvision.datasets import ImageFolder
from feature_extraction import create_features
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import train_test_split
from sklearn.svm import SVC
from sklearn.metrics import accuracy_score
import joblib


dataset = ImageFolder("resize/dataset_1/training_set/")
# label = {0: 'Cat', 1:'Dog'}
def create_feature_matrix():
    # creating labels dataframe
    imgs, labels = zip(*dataset.imgs)
    imgs = list(imgs)
    labels = list(labels)
    labels_df = pd.DataFrame({'image': imgs, 'label': labels})

    features_list = []
    
    for img_path in labels_df.image:
        # get features for image
        img_features = create_features(img_path)
        features_list.append(img_features)
    
    feature_matrix = np.array(features_list)

    # get shape of feature matrix
    print('Feature matrix shape is: ', feature_matrix.shape)
    # define standard scaler
    ss = StandardScaler()
    # run this on our feature matrix
    imgs_stand = ss.fit_transform(feature_matrix)

    X_train, X_test, y_train, y_test = train_test_split(imgs_stand,
                                                        labels_df.label.values,
                                                        test_size=.3,
                                                        random_state=1234123)

    # look at the distribution of labels in the train set
    print(pd.Series(y_train).value_counts())
    # define support vector classifier
    svm = SVC(kernel='linear', probability=True, random_state=42)

    # fit model
    svm.fit(X_train, y_train)

    y_pred = svm.predict(X_test)

    # calculate accuracy
    accuracy = accuracy_score(y_pred, y_test)
    print('Model accuracy is: ', accuracy)
    # save the model to disk
    filename = 'svm_model.sav'
    joblib.dump(svm, filename)

    return svm

