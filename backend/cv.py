import cv2 as cv
import numpy as np
import colorsys

def main():
    img = cv.imread("./test.jpg")

    hsv_img = cv.cvtColor(img, cv.COLOR_BGR2HSV)
    bincount = bincount_app(hsv_img)
    hsv = colorsys.rgb_to_hsv(bincount[0], bincount[1], bincount[2])
    hsv = (int(hsv[0]*360), int(hsv[1]*255), hsv[2])
    bound_lower = np.array([25, 20, 20])
    bound_upper = np.array(list(hsv))

    mask = cv.inRange(hsv_img, bound_lower, bound_upper)
    kernel = np.ones((7, 7), np.uint8)

    mask = cv.morphologyEx(mask, cv.MORPH_CLOSE, kernel)
    mask = cv.morphologyEx(mask, cv.MORPH_OPEN, kernel)

    seg_img = cv.bitwise_and(img, img, mask=mask)
    contours, hier = cv.findContours(
        mask.copy(), cv.RETR_EXTERNAL, cv.CHAIN_APPROX_SIMPLE
    )
    output = cv.drawContours(seg_img, contours, -1, (0, 0, 255), 3)

    cv.imshow("Result", output)
    cv.waitKey(0)
    cv.destroyAllWindows()

def bincount_app(a):
    a2D = a.reshape(-1,a.shape[-1])
    col_range = (256, 256, 256) # generically : a2D.max(0)+1
    a1D = np.ravel_multi_index(a2D.T, col_range)
    print(list(np.unravel_index(np.bincount(a1D).argmax(), col_range)))
    return list(np.unravel_index(np.bincount(a1D).argmax(), col_range))

if __name__ == "__main__":
    main()