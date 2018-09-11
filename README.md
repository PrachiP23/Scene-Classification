# CVIP:Scene Recognition
Given an image, the program determines where it was taken. Following steps were followed:
•	Extracted filter responses by applying filters in the filter bank on each image
•	Generated a visual words dictionary by clustering response of random pixels from each image using k-means. Each cluster represents a word.
•	Generated a wordmap for each image where each pixel is assigned to its closest visual word.
•	Extracted the histogram of visual words. Implemented Spatial Pyramid Matching scheme to improve efficiency.
•	Built a recognition system that will guess the image by comparing histogram of the image with the training set of histograms.
