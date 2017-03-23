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

int main(int argc, char** argv) {
    batchCompressImages();
    return 0;
}