#!/usr/bin/env python

# --------------------------------------------------------
# Fast R-CNN
# Copyright (c) 2015 Microsoft
# Licensed under The MIT License [see LICENSE for details]
# Written by Ross Girshick
# --------------------------------------------------------

"""
Demo script showing detections in sample images.

See README.md for installation instructions before running.
"""

import _init_paths
from fast_rcnn.config import cfg
from fast_rcnn.test import im_detect
from utils.cython_nms import nms
from utils.timer import Timer
import time
import matplotlib.pyplot as plt
import numpy as np
import scipy.io as sio
import caffe, os, sys, cv2
import argparse

CLASSES = ('__background__', 'person')

NETS = {'vgg16': ('VGG16',
                  'vgg16_fast_rcnn_iter_40000.caffemodel'),
        'vgg_cnn_m_1024': ('VGG_CNN_M_1024',
                           'vgg_cnn_m_1024_fast_rcnn_iter_40000.caffemodel'),
        'caffenet': ('CaffeNet',
                     'caffenet_fast_rcnn_iter_10000.caffemodel')}

def ComputeIoU(Rect1, Rect2):
    x1 = Rect1[0]
    y1 = Rect1[1]
    x2 = Rect1[2]
    y2 = Rect1[3]
    X1 = Rect2[0]
    Y1 = Rect2[1]
    X2 = Rect2[2]
    Y2 = Rect2[3]

    startx = min(x1, X1)
    endx = max(x2, X2)
    w1 = x2 - x1
    w2 = X2 - X1
    width = w1 + w2 - (endx - startx)

    starty = min(y1, Y1)
    endy = max(y2, Y2)
    h1 = y2 - y1
    h2 = Y2 - Y1
    height = h1 + h2 - (endy - starty)
    
    if width <= 0 or height <= 0:
	#print 'IoU = ', 0
	return 0
    else:
	Area = height*width
	Area1 = w1*h1
	Area2 = w2*h2
	ratio = Area/(Area1 + Area2 - Area)
	#print 'IoU = ', ratio
	return ratio

def runTest(net, folder, classes, IoUThresh):
    #IoUThresh = 0.3
    ftest = open(folder + '/INRIATest_ImageListWithout80.txt','r')
    imageFileName = folder + ftest.readline().strip()
    num = 0
    outputFile = open(folder + '/PersonDetectionResult.txt', 'w')
    raw_data = sio.loadmat(folder + '/selective_search_data.mat')['all_boxes'].ravel()
    annotationfile = open(folder + '/annotations2.txt','r')
#    split_line = annotationfile.readline().strip().split()

    #box_list = []
    #for i in xrange(raw_data.shape[0]):
        #print raw_data[i][:, (1, 0, 3, 2)] - 1
    #    box_list.append(raw_data[i][:, (1, 0, 3, 2)] - 1)#the syntax seems to be different from the blogger, should as belows:
        #box_list.append(raw_data[i][:,:])
    #print len(box_list)
    count = [0]*5
    gt_sum = 0
    ind_sum = 0
    run_time = 0
    
    while imageFileName:
    #for k in range(10):
        #imageFileName = folder + '/' + ftest.readline().strip()
        print 'now is', num
        print imageFileName
	split_line = annotationfile.readline().strip().split()
	gt_num = int(split_line[1])
	gt_boxes = np.zeros((gt_num, 4), dtype = np.uint16)
	for i in range(gt_num):
	    x1 = float(split_line[2 + i * 4])
	    y1 = float(split_line[3 + i * 4])
	    x2 = float(split_line[4 + i * 4])
	    y2 = float(split_line[5 + i * 4])
	    gt_boxes[i, :] = [x1, y1, x2, y2]
	#print obj_proposals[num-1]
        #print 'now is', num
        #num += 1
        #time.sleep(1)
	im = cv2.imread(imageFileName)
	if num < 80:
	    obj_proposals = raw_data[num][:, (1, 0, 3, 2)] - 1
	else:
	    obj_proposals = raw_data[num + 1][:, (1, 0, 3, 2)] - 1
	timer = Timer()
	timer.tic()
	scores, boxes = im_detect(net, im, obj_proposals)
	timer.toc()
	run_time += timer.total_time
	#print ('Detection took {:.3f} for {:d} object proposals').format(timer.total_time, boxes.shape[0])
	CONF_THRESH = 0.8
	NMS_THRESH = 0.3
	for cls in classes:
	    cls_ind = CLASSES.index(cls)
	    cls_boxes = boxes[:, 4*cls_ind:4*(cls_ind + 1)]
	    cls_scores = scores[:, cls_ind]
	    dets = np.hstack((cls_boxes, cls_scores[:,np.newaxis])).astype(np.float32)
            #print 'dets.size', dets.size
	    keep = nms(dets, NMS_THRESH)
	    dets = dets[keep, :]
	    #print 'All {} detections with p({} | box) >= {:.1f}'.format(cls, cls, CONF_THRESH)
	    #vis_detections(im, cls, dets, 'crop001501', thresh=CONF_THRESH)
	inds = np.where(dets[:, -1] >= CONF_THRESH)[0]
	#print inds
	print 'inds.size', inds.size
	ind_sum += inds.size
	#time.sleep(30)
	#os.system("pause")
	#count = 0
	gt_sum += gt_num
	if inds.size!=0:
	    outputFile.write('\n' + imageFileName + ' ' + str(int(inds.size)) + ' ')
	#for j in range(gt_num):
	#    print 'gt_boxes of', j, gt_boxes[j, :]
        IoUThreshs = [0.1, 0.3, 0.5, 0.7, 0.8]
        for k in xrange(5):

            gt_label = [0] * gt_num
            Overlaps = 0
	    for i in range(inds.size):
	        bbox = dets[inds[i], :4]
	    #outputFile.write(str(int(bbox[0]))+' '+ str(int(bbox[1]))+' '+ str(int(bbox[2]))+' '+ str(int(bbox[3]))+' ')
                Overlap = 0
	        for j in range(gt_num):
		#Overlap = 0
	            if ComputeIoU(bbox, gt_boxes[j, :]) >= IoUThreshs[k]:
		    #count += 1
		        Overlap = 1
                        gt_label[j] = 1
		    #break
	        if Overlap:
                #count += 1
                    Overlaps += 1
		#continue
		#else:
	#outputFile.write('\n')
            count[k] += min(gt_label.count(1), Overlaps)

	temp = folder + ftest.readline().strip()
	#outputFile.write('\n')
	if temp:
	    imageFileName = temp
	else:
	    break
	num += 1
	if num == 287:
	    break
    ftest.close()
    outputFile.close()
    print 'average running time is', float(run_time*1.0/num)
    print 'ground truth sum is', gt_sum
    #print 'number of correct prediction is', count
    print 'number of predictions is', ind_sum
    for k in xrange(5):
        print 'number of correct prediction with IoU ', IoUThreshs[k], ' is ', count[k]
        print 'Average Precision is', float(count[k]*1.0/ind_sum)
        print 'Average Recall is', float(count[k]*1.0/gt_sum)
    	


def vis_detections(im, class_name, dets, image_name, thresh=0.5):
    """Draw detected bounding boxes."""
    inds = np.where(dets[:, -1] >= thresh)[0]
    max_score = 0.0
    max_inds = 0
    if len(inds) == 0:
        print("no target detected!")
        return
    elif len(inds) > 1:
        print ('more than 1 target detected!')
        for i in inds:
            if(dets[i, -1] > max_score):
                max_inds = i
                max_score = dets[i, -1]

    im = im[:, :, (2, 1, 0)]
    fig, ax = plt.subplots(figsize=(12, 12))
    ax.imshow(im, aspect='equal')
    for i in inds:
        bbox = dets[i, :4]
        score = dets[i, -1]

        ax.add_patch(
            plt.Rectangle((bbox[0], bbox[1]),
                          bbox[2] - bbox[0],
                          bbox[3] - bbox[1], fill=False,
                          edgecolor='red', linewidth=3.5)
            )
        ax.text(bbox[0], bbox[1] - 2,
                '{:s} {:.3f}'.format(class_name, score),
                bbox=dict(facecolor='blue', alpha=0.5),
                fontsize=14, color='white')

    ax.set_title(('{} detections with '
                  'p({} | box) >= {:.1f}').format(class_name, class_name,
                                                  thresh),
                  fontsize=14)
    plt.axis('off')
    plt.tight_layout()
    plt.draw()
    plt.savefig(image_name + '_' + class_name)

def demo(net, image_name, classes):
    """Detect object classes in an image using pre-computed object proposals."""

    # Load pre-computed Selected Search object proposals
    box_file = os.path.join(cfg.ROOT_DIR, 'data', 'demo',
                            image_name + '_boxes.mat')
    #obj_proposals = sio.loadmat(box_file)['boxes']
    obj_proposals = sio.loadmat(box_file)['all_boxes']

    # Load the demo image
    im_file = os.path.join(cfg.ROOT_DIR, 'data', 'demo', image_name + '.png')
    im = cv2.imread(im_file)

    # Detect all object classes and regress object bounds
    timer = Timer()
    timer.tic()
    scores, boxes = im_detect(net, im, obj_proposals)
    timer.toc()
    print ('Detection took {:.3f}s for '
           '{:d} object proposals').format(timer.total_time, boxes.shape[0])

    # Visualize detections for each class
    CONF_THRESH = 0.8
    NMS_THRESH = 0.3
    for cls in classes:
        cls_ind = CLASSES.index(cls)
        cls_boxes = boxes[:, 4*cls_ind:4*(cls_ind + 1)]
        cls_scores = scores[:, cls_ind]
        keep = np.where(cls_scores >= CONF_THRESH)[0]
        cls_boxes = cls_boxes[keep, :]
        cls_scores = cls_scores[keep]
        dets = np.hstack((cls_boxes,
                          cls_scores[:, np.newaxis])).astype(np.float32)
        keep = nms(dets, NMS_THRESH)
        dets = dets[keep, :]
        print 'All {} detections with p({} | box) >= {:.1f}'.format(cls, cls,
                                                                    CONF_THRESH)
        vis_detections(im, cls, dets, image_name, thresh=CONF_THRESH)

def parse_args():
    """Parse input arguments."""
    parser = argparse.ArgumentParser(description='Train a Fast R-CNN network')
    parser.add_argument('--gpu', dest='gpu_id', help='GPU device id to use [0]',
                        default=0, type=int)
    parser.add_argument('--cpu', dest='cpu_mode',
                        help='Use CPU mode (overrides --gpu)',
                        action='store_true')
    parser.add_argument('--net', dest='demo_net', help='Network to use [vgg_cnn_m_1024]',
                        choices=NETS.keys(), default='caffenet')        
    parser.add_argument('--IoU', dest='IoUThresh',help='Threshold of IoU', type=float, default=0.7)                
#choices=NETS.keys(), default='vgg_cnn_m_1024')

    args = parser.parse_args()

    return args

if __name__ == '__main__':
    args = parse_args()

    prototxt = os.path.join(cfg.ROOT_DIR, 'models', NETS[args.demo_net][0],
                            'test.prototxt')
    #caffemodel = os.path.join(cfg.ROOT_DIR, 'output', 'default', 'INRIATrain', 
    #                          NETS[args.demo_net][1])
    #caffemodel = '/home/zywang/fast-rcnn/output/default/INRIATrain/caffenet_fast_rcnn_INRIA_iter_30000.caffemodel'
    #caffemodel = '/home/zywang/fast-rcnn/data/imagenet_models/CaffeNet.v2.caffemodel'
    #caffemodel = '/home/zywang/fast-rcnn/data/imagenet_models/VGG_CNN_M_1024.v2.caffemodel'
    caffemodel = '/home/zywang/fast-rcnn/output/default/INRIATrain/vgg_cnn_m_1024_fast_rcnn_iter_30000.caffemodel'

    if not os.path.isfile(caffemodel):
        raise IOError(('{:s} not found.\nDid you run ./data/scripts/'
                       'fetch_fast_rcnn_models.sh?').format(caffemodel))

    if args.cpu_mode:
        caffe.set_mode_cpu()
    else:
        caffe.set_mode_gpu()
        caffe.set_device(args.gpu_id)
    net = caffe.Net(prototxt, caffemodel, caffe.TEST)

    print '\n\nLoaded network {:s}'.format(caffemodel)

    print '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
    #print 'Demo for data/demo/test1.jpg'
    #demo(net, 'crop001001', ('person',))
    print 'running Testing...'
    runTest(net, '/home/zywang/INRIATest/DataSet/', ('person',), args.IoUThresh)
    print '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
    
    

    #plt.show()
