#ifndef __JPEG_TOOLS_H__
#define __JPEG_TOOLS_H__

#include <stdio.h>
#include "image.h"

typedef struct jpeg_t {
    FILE* f;
    int* dims;
    pixel* pixel_buf;
}jpeg;

jpeg* create_jpeg(const char* filename, int* dims);
void fill_jpeg(jpeg* jpeg, pixel* pixel_buf);
void kill_jpeg(jpeg* jpeg);

#endif  /* __JPEG_TOOLS_H__ */