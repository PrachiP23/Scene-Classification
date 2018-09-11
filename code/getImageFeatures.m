function [h] = getImageFeatures(wordMap, dictionarySize)
% Compute histogram of visual words
% Inputs:
% 	wordMap: WordMap matrix of size (h, w)
% 	dictionarySize: the number of visual words, dictionary size
% Output:
%   h: vector of histogram of visual words of size dictionarySize (l1-normalized, ie. sum(h(:)) == 1)

	% TODO Implement your code here    
%    wordMapSize= size(wordMap.wordMap,1)*size(wordMap.wordMap,2);
    %hist(array) - plot histogram
    h=zeros(1,dictionarySize);
    for i =1:dictionarySize
%         h(1,i)= sum(wordMap(:) == i);
        h=hist(wordMap(:),i);        
    end
%     size(h);
    h=h./sum(h);
    assert(numel(h) == dictionarySize);
    h=h';
%     h= histogram(wordMap.wordMap,i);
end