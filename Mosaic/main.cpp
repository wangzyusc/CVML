#include "colorHistVector.h"
#include "util.h"

using namespace std;
using namespace cv;


// Reference to matlab quadtree decomposition
void qtDecomp(Mat& src){
    
}

int main(int argc, char** argv) {
    // Step 1: compress library images to 100*100.
    // util::batchCompressImages();
    // Step 2: try to get the color histogram of each library image.
    // util::meanSquaresTester();
    util::check_cv_version();
    util::colorHistVectorTester();
    return 0;
}
