/**
 * Created by Zhiyuan Wang on 15/06/2017.
 * It's a class used to describe the color histogram of an image by a vector.
**/

#ifndef MOSAIC_COLORHISTVECTOR_H
#define MOSAIC_COLORHISTVECTOR_H

#include <vector>
#include <cassert>
#include <string>
#include <opencv/cv.h>

using namespace std;
using namespace cv;

class colorHistVector {
private:
    int colorSpaceResolution;
    vector<vector<vector<double>>> mVector;
public:
    /**
     * Constructor of colorHistVector. Will store the vector values in
     * the 3-dimensional array. Each entry of vector is the frequency (0-1)
     * of pixels in that color range.
     * @param img Assume the input Mat img is in rgb256 format.
     * @param colorRes color space resolution, to reduce the size of 3d vector.
     */
    colorHistVector(Mat& img, int colorRes = 10);
    /**
     * Calculate the distance in rgb space between 2 color histogram vectors.
     * @param vector1 an object of class colorHistVector
     * @param vector2 another object of class colorHistVector
     * @return
     */
    static double colorDistance(colorHistVector& vector1, colorHistVector& vector2);
    /**
     * Calculate the color distribution similarity between 2 color histogram vectors.
     * @param vector1 an object of class colorHistVector
     * @param vector2 another object of class colorHistVector
     * @return
     */
    static double colorSimilarity(colorHistVector &vector1, colorHistVector &vector2);
    /**
     * Export the vector to json file on harddisk. (Make database further)
     * @param path
     */
    void exportToJson(string path);
};


#endif //MOSAIC_COLORHISTVECTOR_H
