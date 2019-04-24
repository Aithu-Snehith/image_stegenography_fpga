import serial

PORT='/dev/ttyUSB0'
BAUD = 115200

fd = serial.Serial(port=PORT, baudrate=BAUD)

#a = 'HelloWorld'

while True:
    a = fd.read(1024)
    a = [ord(i) for i in list(a)]
    #a = format(a, 'b')
    #a = int(a,2)
    print(a)
