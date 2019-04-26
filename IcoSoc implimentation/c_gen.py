import sys
import numpy as np

np.set_printoptions(threshold=sys.maxsize)

from scipy.misc import imread, imsave

img_actual = imread("pic_2.jpg")
# print(img[0][0])
#
# imsave("test_1.png", img)
# img_1 = imread("test_1.png")
print(img_actual.shape)
img = img_actual[:,:,0]
img = str(img)
img = img.replace('[','{')
img = img.replace(']','}')
img = img.replace('\n ',' ')
img = img.replace(' ',',')
img = img.replace('} {','},\n{')
img = img.replace(',,',',')
img = img.replace(',,',',')
img = img.replace('},','},\n')
img = img.replace('{,','{')
print(img)
# img = img.replace("[","{").replace("]","}").replace(" ",",").replace(",,",",")
# print(img)
