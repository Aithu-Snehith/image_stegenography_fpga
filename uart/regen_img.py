import serial
import numpy as np
import scipy.misc
from scipy.misc import imread, imsave

PORT='/dev/ttyUSB0'
BAUD = 115200

fd = serial.Serial(port=PORT, baudrate=BAUD)

#a = 'HelloWorld'

# while True:
#     a = fd.read(1024)
#     a = [ord(i) for i in list(a)]
#     #a = format(a, 'b')
#     #a = int(a,2)
#     print(a)

a = fd.read(1024)
temp = [ord(i) for i in list(a)]
a = temp[-16:] + temp[:-16]
a = np.array(a).reshape(32,32)
print(a.shape)
scipy.misc.toimage(a, cmin = 0.0, cmax =255).save('mod.png')
a = imread("mod.png")
print(a)
