function [filterResponses] = extractFilterResponses(img, filterBank)
% Extract filter responses for the given image.
% Inputs: 
%   img:                a 3-channel RGB image with width W and height H
%   filterBank:         a cell array of N filters
% Outputs:
%   filterResponses:    a W x H x N*3 matrix of filter responses


% TODO Implement your code here
    img= double(img);  %convert to double
    %check if the image is grayscale
    if ndims(img) <= 2
        img = repmat(img,[1 1 3]);
    end
    lab_im = RGB2Lab(img);
    size_filter = size(filterBank);
    filterResponses = [];
%     colg_img=[];
%     colg_img1=[];
%     size(filterResponses);
    for i=1:size_filter(1)
%      filterResponses = imfilter(lab_im, filterBank{i,1},'same','conv');
%      colg_img = [colg_img,filterResponses];
        filterResponses = cat(3, filterResponses,imfilter(lab_im, filterBank{i,1},'same','conv','replicate'));
    end
%     montage(colg_img,[4 5])
%     imshow(colg_img)    
end
