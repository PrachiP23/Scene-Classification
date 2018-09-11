function [wordMap] = getVisualWords(img, filterBank, dictionary)
% Compute visual words mapping for the given image using the dictionary of visual words.

% Inputs:
% 	img: Input RGB image of dimension (h, w, 3)
% 	filterBank: a cell array of N filters
% Output:
%   wordMap: WordMap matrix of same size as the input image (h, w)

    % TODO Implement your code here
    filterResponse = extractFilterResponses(img, filterBank);
    filterResponse = reshape(filterResponse, [size(filterResponse,1)*size(filterResponse,2) size(filterResponse,3)]);
    dictionary = dictionary';
    %closest distance
    eculDistance = pdist2(dictionary, filterResponse);
    minDist = min(eculDistance);
    wordMap = zeros(size(img,1)*size(img,2), 1);
    for i=1:length(minDist)
        wordMap(i) = find(eculDistance(:,i) == minDist(i));         %find indice where the condition is true
    end
    wordMap = reshape(wordMap, size(img,1), size(img,2)); 
    imagesc(wordMap)
end
