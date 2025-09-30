import cv2
from matplotlib import pyplot as plt

img = cv2.imread("0.png")



img_rgb = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
img_gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

stop_cascade = cv2.CascadeClassifier('classifier/cascade.xml')

found = stop_cascade.detectMultiScale(img_gray, minSize=(20, 20))

for (x, y, w, h) in found:
    cv2.rectangle(img_rgb, (x, y), (x + w, y + h), (0, 255, 0), 5)

plt.imshow(img_rgb)
plt.show()