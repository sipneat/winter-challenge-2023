from tensorflow.keras.models import load_model
import cv2 as cv
import numpy as np

def main():
    img = cv.imread("./test.jpg")

    rgb_colors = find_majority_colors(img)
    predicted_label = preprocess_image(img)

def find_majority_colors(img):
    img_rgb = cv.cvtColor(img, cv.COLOR_BGR2RGB)
    pixels = img_rgb.reshape((-1, 3))
    pixels = np.float32(pixels)
    criteria = (cv.TERM_CRITERIA_EPS + cv.TERM_CRITERIA_MAX_ITER, 10, 1.0)
    k = 2  # Finding top 2 dominant colors
    ret, labels, centers = cv.kmeans(pixels, k, None, criteria, 10, cv.KMEANS_RANDOM_CENTERS)
    centers = np.uint8(centers)
    counts = np.bincount(labels.flatten())
    top_2_indices = np.argsort(counts)[-2:]
    top_2_colors = [centers[i].tolist() for i in top_2_indices]

    print(top_2_colors)
    return top_2_colors

# Function to preprocess the uploaded image
def preprocess_image(img):
    img = cv.cvtColor(img, cv.COLOR_BGR2GRAY)
    img = cv.resize(img, (28, 28))
    img = img.astype('float32') / 255
    img = np.expand_dims(img, axis=-1)

    model = load_model('./fashion_model.h5')

    prediction = model.predict(np.array([img]))
    predicted_class = np.argmax(prediction)

    # Map the class index to the class name (for Fashion MNIST)
    class_names = [
    'T-shirt/top', 'Trouser', 'Pullover', 'Dress', 'Coat',
    'Sandal', 'Shirt', 'Sneaker', 'Bag', 'Ankle boot'
    ] 

    predicted_label = class_names[predicted_class]
    print(f"Predicted Clothing Item: {predicted_label}")
    return predicted_label

if __name__ == "__main__":
    main()