import numpy as np
from scipy.misc import imread, imsave
a = [59, 165, 219, 245, 49, 39, 130, 86, 242, 209, 104, 27, 234, 9, 88, 195, 102, 143, 34, 27, 7, 236, 15, 128, 221, 24, 27, 145, 230, 188, 102, 253, 72, 220, 228, 157, 179, 248, 80, 83, 56, 152, 37, 236, 192, 217, 173, 55, 117, 116, 188, 8, 61, 248, 251, 252, 200, 81, 249, 67, 104, 79, 224, 237, 200, 39, 154, 183, 50, 135, 118, 45, 152, 225, 144, 231, 205, 137, 78, 45, 241, 228, 107, 61, 88, 96, 243, 14, 87, 25, 120, 197, 55, 23, 169, 1, 128, 44, 85, 143, 197, 112, 60, 97, 22, 115, 130, 143, 9, 182, 240, 121, 243, 58, 12, 204, 245, 20, 187, 111, 54, 139, 138, 170, 250, 183, 67, 132, 234, 227, 58, 190, 101, 155, 71, 133, 52, 85, 29, 151, 60, 216, 188, 111, 4, 171, 7, 165, 122, 116, 77, 228, 85, 124, 120, 50, 152, 69, 144, 50, 64, 59, 110, 49, 241, 91, 212, 181, 94, 252, 122, 215, 83, 120, 10, 42, 176, 175, 190, 145, 86, 239, 98, 57, 29, 169, 36, 29, 137, 190, 181, 189, 48, 158, 228, 46, 219, 216, 112, 42, 245, 136, 22, 223, 114, 51, 9, 233, 117, 233, 31, 8, 168, 15, 17, 143, 57, 60, 177, 248, 178, 207, 253, 253, 74, 211, 59, 119, 100, 98, 108, 116, 243, 75, 32, 143, 235, 34, 229, 26, 83, 30, 237, 212, 177, 24, 107, 207, 36, 115, 148, 91, 175, 113, 103, 223, 177, 154, 37, 191, 111, 219, 226, 208, 112, 200, 65, 12, 59, 163, 56, 64, 228, 239, 149, 226, 194, 124, 67, 131, 155, 31, 136, 193, 145, 214, 31, 118, 39, 177, 153, 245, 217, 0, 223, 48, 202, 217, 133, 110, 118, 75, 110, 250, 85, 254, 157, 238, 97, 156, 11, 235, 218, 0, 233, 15, 67, 150, 216, 104, 129, 132, 253, 234, 91, 234, 224, 199, 140, 36, 228, 16, 134, 97, 249, 58, 185, 121, 43, 31, 228, 137, 47, 9, 121, 125, 253, 135, 218, 139, 89, 145, 177, 47, 75, 186, 76, 120, 216, 43, 33, 73, 94, 233, 219, 237, 108, 12, 98, 122, 141, 87, 94, 168, 44, 246, 5, 200, 118, 200, 118, 209, 93, 98, 66, 97, 199, 58, 32, 201, 122, 104, 230, 17, 230, 90, 136, 99, 177, 110, 239, 119, 124, 161, 86, 191, 210, 236, 111, 44, 22, 169, 33, 3, 53, 203, 26, 137, 136, 17, 16, 14, 44, 230, 221, 199, 45, 156, 117, 253, 139, 162, 61, 187, 31, 149, 158, 204, 10, 100, 18, 52, 158, 181, 245, 247, 185, 121, 131, 215, 111, 132, 153, 85, 77, 13, 131, 115, 138, 181, 89, 5, 81, 50, 35, 1, 145, 232, 109, 86, 221, 231, 57, 254, 196, 53, 183, 124, 221, 48, 195, 243, 232, 23, 232, 39, 166, 30, 212, 75, 44, 105, 67, 7, 158, 68, 60, 218, 193, 82, 104, 237, 134, 101, 240, 175, 94, 117, 100, 153, 206, 141, 196, 103, 191, 73, 48, 178, 101, 225, 36, 240, 192, 184, 69, 39, 134, 85, 251, 85, 120, 195, 62, 157, 62, 171, 200, 34, 230, 122, 123, 84, 73, 37, 53, 197, 45, 124, 33, 184, 70, 98, 195, 160, 47, 11, 3, 46, 5, 23, 220, 216, 99, 155, 48, 82, 227, 109, 205, 164, 157, 136, 6, 249, 61, 232, 156, 230, 197, 4, 30, 50, 107, 202, 254, 84, 208, 211, 249, 128, 158, 170, 251, 154, 72, 111, 4, 193, 138, 54, 204, 85, 57, 98, 221, 219, 124, 204, 131, 69, 3, 184, 245, 10, 100, 41, 23, 224, 23, 14, 250, 2, 174, 243, 132, 113, 19, 218, 6, 56, 118, 193, 92, 215, 7, 142, 57, 89, 84, 207, 192, 65, 68, 80, 31, 81, 190, 157, 111, 207, 228, 247, 2, 113, 86, 21, 200, 35, 185, 208, 236, 156, 70, 214, 193, 121, 235, 35, 33, 21, 73, 142, 211, 72, 139, 109, 148, 88, 212, 2, 220, 208, 239, 223, 116, 149, 216, 180, 19, 21, 78, 58, 220, 59, 185, 127, 191, 166, 27, 104, 135, 245, 118, 68, 30, 92, 161, 151, 219, 122, 167, 98, 34, 42, 246, 87, 170, 72, 18, 109, 178, 177, 212, 45, 6, 164, 173, 115, 152, 168, 122, 143, 90, 132, 219, 8, 57, 173, 211, 196, 203, 217, 157, 181, 84, 35, 41, 55, 239, 44, 18, 225, 155, 198, 168, 212, 18, 50, 105, 247, 67, 220, 36, 176, 51, 16, 124, 33, 152, 59, 191, 172, 28, 78, 135, 110, 204, 214, 38, 58, 182, 70, 156, 191, 234, 159, 15, 139, 208, 102, 45, 192, 59, 38, 17, 76, 82, 77, 46, 103, 3, 104, 81, 178, 239, 57, 141, 16, 196, 76, 152, 61, 164, 196, 145, 112, 128, 159, 197, 1, 80, 180, 37, 228, 203, 254, 31, 114, 195, 190, 116, 17, 74, 173, 185, 23, 1, 53, 162, 113, 104, 56, 156, 229, 63, 237, 202, 225, 17, 14, 172, 238, 95, 196, 4, 152, 103, 117, 166, 144, 142, 91, 195, 247, 91, 220, 210, 48, 65, 135, 50, 15, 105, 218, 185, 99, 200, 217, 103, 38, 235, 53, 181, 168, 91, 80, 58, 182, 183, 41, 171, 122, 22, 208, 183, 114, 193, 113, 19, 125, 57, 79, 138, 186, 184, 170, 213, 221, 198, 223, 183, 83, 86, 169, 45, 30, 116, 103, 213, 245, 136, 76, 129, 190, 124, 121, 249, 91, 61, 77, 83, 246, 71, 123, 187, 28, 17, 250, 69, 93, 172, 6, 123, 246, 198, 110, 173, 111, 32, 69, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0, 23, 21, 79, 15, 182, 214, 178, 239, 127, 224, 227, 1, 111, 99, 59, 165, 58, 138]

print(len(a))
a = np.array(a).reshape(32,32,1)
print(a)
b = np.random.randint(0,255,(32,32,2))

img = np.concatenate((a,b), axis = 2)
print(img[:,:,0])
print(img.shape)
imsave('mod.png', img)