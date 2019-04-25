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

#a = np.genfromtxt("output_raspi.txt", skip_header=15)
a = imread("mod.png")
#imsave("regen.png",img_actual)

msg_len = int(10*(a[-1][-2]%10) + a[-1][-1]%10)
print(msg_len)
rows = 31
cols = 29
yeet = []

flet = a.flatten()[-1*int(8*msg_len + 2):-2].astype(int)
# print(len(flet))
bits = list(flet & np.ones_like(flet).astype(int))
# for i in range(int(8*msg_len + 2)):
# bits = [i|1 for i in flet]
# print(flet)
bits.reverse()
print(bits)
message = frombits(list(bits))
print(msg_len)
print("HIDDEN MESSAGE : " + str(message))
