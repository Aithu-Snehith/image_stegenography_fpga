import numpy as np
import sys
import numpy
numpy.set_printoptions(threshold=sys.maxsize)
from scipy.misc import imread, imsave

message = "snehith is here"
img_actual = imread("pic.jpg")
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


file_c = r'''#include <stdio.h>
#include<string.h>

int main()
{
  int i = 0, j = 0;
  char message[99] = "''' + message + r'''";
int msg_len = strlen(message);

int img[50][50] = ''' + img + r''';

  img[49][49] = (img[49][49]/10) + msg_len%10;
  img[49][48] = (img[49][48]/10) + msg_len/10;

  int col = 49,row = 49;

  for(i = 0 ; i < msg_len ; i++)
  {
    for(j=0 ; j < 8 ; j++)
    {
      char temp_msg = message[i];
      if(col < 0)
      {
        row--;
        col = 49;
      }
      if(row == 49 && col == 49) col = 47;

      int img_bit = img[row][col] & 1;
      temp_msg = temp_msg>>j;
			int msg_bit = temp_msg & 1;

      if(msg_bit == img_bit)  ;
      else{
        if(img_bit==0)	img[row][col] = (img[row][col] | 1);
				else
				{
					img[row][col] = (img[row][col] & ~1);
				}
      }
      col-- ;
    }
  }

  for (i = 0;i < 50; i++)
	{
		for(j = 0;j < 50; j++)
		{
			printf("%d ",img[i][j]);
			for (int i = 0; i < 10000; i++)
				asm volatile ("");
		}
		printf("\n");
	}
  return 0;
}'''

with open('main.c', 'w') as f:
    f.write(file_c)
