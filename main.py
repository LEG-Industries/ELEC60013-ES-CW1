from lis3dh import *

print("Raspberry Pi Zero W, up and running!")
bus = smbus2.SMBus(1)
accel = lis3dh(bus)

print("LIS3DH initiated successfully!")

while True:
    [X,Y,Z] = accel.readAll()
    print("X: ",X,"\tY: ",Y,"\t Z: ",Z,"\n")