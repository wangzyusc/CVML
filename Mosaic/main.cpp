#include <iostream>
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/highgui/highgui.hpp"

using namespace std;
using namespace cv;

Mat src; Mat dst;
char window_name1[] = "Original image";
char window_name2[] = "Processed image";

int main(int argc, char** argv) {

    src = imread(argv[1]);
    namedWindow(window_name1);
    imshow(window_name1, src);

    dst = src.clone();
    GaussianBlur(dst, dst, Size(15, 15), 0, 0);

    namedWindow(window_name2);
    imshow(window_name2, dst);
    waitKey();

    return 0;
}