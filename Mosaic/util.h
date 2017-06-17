/**
 * Created by Zhiyuan Wang on 16/06/2017.
 * It's a class to provide some useful helping functions.
 */

#ifndef MOSAIC_UTIL_H
#define MOSAIC_UTIL_H

#include <iostream>
#include <string>
#include <fstream>
#include <opencv/cv.h>
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/highgui/highgui.hpp"
#include "colorHistVector.h"

using namespace std;
using namespace cv;

class util {
public:
    static void check_cv_version();
    static void batchCompressImages();
    static void meanSquares(const Mat& src, Mat& dst, const int granular_size = 10);
    static void meanSquaresTester();
    static void colorHistVectorTester();
};


#endif //MOSAIC_UTIL_H
