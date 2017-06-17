//
// Created by Zhiyuan Wang on 16/06/2017.
//

#include "util.h"

using namespace std;
using namespace cv;

const int compress_size = 100;

void util::check_cv_version() {
    cout << "********** OpenCV Version **********" << endl;
    cout << CV_MAJOR_VERSION << "." << CV_MINOR_VERSION << endl;
    cout << "************************************" << endl;
}

void util::batchCompressImages(void){
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

void util::meanSquares(const Mat& src, Mat& dst, const int granular_size){
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

void util::meanSquaresTester(void){
    Mat src = imread("../lena.bmp");
    Mat dst;
    imshow("src", src);
    waitKey();
    meanSquares(src, dst, 3);
    imshow("dst", dst);
    waitKey();
}

void util::colorHistVectorTester() {
    Mat src1 = imread("../lena.bmp");
    Mat src2 = imread("../defend_the_land.png");
    colorHistVector vector1(src1), vector2(src2);
    double dist = colorHistVector::colorDistance(vector1, vector2);
    cout << "The distance between two vectors are " << dist << endl;
    Scalar diff = mean(src1) - mean(src2);
    double square_sum = 0;
    for(int i = 0; i < 3; i++) square_sum += pow(diff[i], 2);
    cout << "The distance between average color of two images are " << sqrt(square_sum) << endl;
    double similarity = colorHistVector::colorSimilarity(vector1, vector2);
    cout << "The similarity between two images are " << similarity << endl;
}
