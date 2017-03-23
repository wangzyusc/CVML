#include <iostream>
#include <string>
#include <fstream>
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/highgui/highgui.hpp"

using namespace std;
using namespace cv;

const int compress_size = 100;

void batchCompressImages(void){
    string path = "../aflw 2/data/flickr/";
    string src_path = path + "0/";
    string dst_path = path + "compressed/";

    ifstream list_file("../list.txt");

    string line;
    while(getline(list_file, line)){
        cout << line << endl;
        Mat src = imread(src_path + line);
        int dst_size = min(src.cols, src.rows);
        Mat dst = src(Range((src.rows - dst_size)/2, (src.rows + dst_size)/2),
                      Range((src.cols - dst_size)/2, (src.cols + dst_size)/2));
        resize(dst, dst, Size(compress_size, compress_size));
        imwrite(dst_path + line, dst);
    }
}

void meanSquares(const Mat& src, Mat& dst, const int granular_size = 10){
    dst = Mat(src.rows, src.cols, src.type());
    for(int y = 0; y < ceil(src.rows * 1.0 / granular_size); y++){
        for(int x = 0; x < ceil(src.cols * 1.0 / granular_size); x++){
            int sum_r = 0, sum_g = 0, sum_b = 0;
            int bias_y = y * granular_size, bias_x = x * granular_size;
            int range_y = min(granular_size, src.rows - bias_y);
            int range_x = min(granular_size, src.cols - bias_x);
            for(int j = 0; j < range_y; j++){
                for(int i = 0; i < range_x; i++){
                    sum_r += src.at<Vec3b>(bias_y + j, bias_x + i)[2];
                    sum_g += src.at<Vec3b>(bias_y + j, bias_x + i)[1];
                    sum_b += src.at<Vec3b>(bias_y + j, bias_x + i)[0];
                }
            }
            sum_r /= (granular_size * granular_size);
            sum_g /= (granular_size * granular_size);
            sum_b /= (granular_size * granular_size);
            for(int j = 0; j < range_y; j++){
                for(int i = 0; i < range_x; i++){
                    dst.at<Vec3b>(bias_y + j, bias_x + i)[2] = sum_r;
                    dst.at<Vec3b>(bias_y + j, bias_x + i)[1] = sum_g;
                    dst.at<Vec3b>(bias_y + j, bias_x + i)[0] = sum_b;
                }
            }
        }
    }
}

void meanSquaresTester(void){
    Mat src = imread("../lena.bmp");
    Mat dst;
    imshow("src", src);
    waitKey();
    meanSquares(src, dst, 3);
    imshow("dst", dst);
    waitKey();
}

int main(int argc, char** argv) {
    //batchCompressImages();
    meanSquaresTester();
    return 0;
}