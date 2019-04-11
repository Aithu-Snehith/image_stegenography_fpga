import numpy as np
import sys
import numpy
numpy.set_printoptions(threshold=sys.maxsize)
from scipy.misc import imread, imsave

def frombits(bits):
    chars = []
    for b in range(len(bits) / 8):
        byte = bits[b*8:(b+1)*8]
        # print(''.join([str(bit) for bit in byte]))
        chars.append(chr(int(''.join([str(bit) for bit in byte]), 2)))
    return ''.join(chars)

a = np.genfromtxt("output_raspi.txt", skip_header=15)
img_actual = imread("pic.jpg")
img_actual[:,:,0] = a
imsave("regen.png",img_actual)

a = imread("regen.png")[:,:,0]
msg_len = int(10*(a[-1][-1]%10) + a[-1][-2]%10) -1

rows = 49
cols = 47
yeet = []

flet = a.flatten()[-1*int(8*msg_len + 2):-2].astype(int)
# print(len(flet))
bits = flet & np.ones_like(flet).astype(int)
# for i in range(int(8*msg_len + 2)):
# bits = [i|1 for i in flet]
# print(flet)
list(bits).reverse()
message = frombits(list(bits))[::-1]
print("HIDDEN MESSAGE : " + str(message))
