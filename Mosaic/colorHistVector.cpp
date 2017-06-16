/**
 * Created by Zhiyuan Wang on 15/06/2017.
 * It's a class used to describe the color histogram of an image by a vector.
**/

#include "colorHistVector.h"

colorHistVector::colorHistVector(Mat &img, int colorRes) {
    this->colorSpaceResolution = colorRes;
    int pixel_count = img.cols * img.rows;
    double increment_unit = 1.0 / pixel_count;
    int colorLevelCount = round(256.0 / colorRes);
    //this->mVector = vector<vector<vector<float>>>();
    for(int i = 0; i < colorLevelCount; i++){
        vector<vector<double>> row_g;
        for(int j = 0; j < colorLevelCount; j++){
            vector<double> row_b(colorLevelCount);
            row_g.push_back(row_b);
        }
        mVector.push_back(row_g);
    }
    for(int j = 0; j < img.rows; j++){
        for(int i = 0; i < img.cols; i++){
            int r = img.at<Vec3b>(j, i)[2] / colorRes;
            int g = img.at<Vec3b>(j, i)[1] / colorRes;
            int b = img.at<Vec3b>(j, i)[0] / colorRes;
            mVector[r][g][b] += increment_unit;
        }
    }
}

double colorHistVector::colorDistance(colorHistVector &vector1,
                                             colorHistVector &vector2) {
    assert(vector1.colorSpaceResolution == vector2.colorSpaceResolution);
    int colorLevelCount = round(256.0 / vector1.colorSpaceResolution);
    double square_sum = 0;
    vector<vector<vector<double>>> array1 = vector1.mVector,
                                   array2 = vector2.mVector;
    for(int r = 0; r < colorLevelCount; r++){
        for(int g = 0; g < colorLevelCount; g++){
            for(int b = 0; b < colorLevelCount; b++){
                square_sum += pow(array1[r][g][b] - array2[r][g][b], 2);
            }
        }
    }
    return sqrt(square_sum) * vector1.colorSpaceResolution;
}