function [h] = getImageFeaturesSPM(layerNum, wordMap, dictionarySize)
% Compute histogram of visual words using SPM method
% Inputs:
%   layerNum: Number of layers (L+1)
%   wordMap: WordMap matrix of size (h, w)
%   dictionarySize: the number of visual words, dictionary size
% Output:
%   h: histogram of visual words of size {dictionarySize * (4^layerNum - 1)/3} (l1-normalized, ie. sum(h(:)) == 1)

    % TODO Implement your code here
       histSize = dictionarySize * (4^layerNum - 1)/3;
       [r,c] = size(wordMap);   %wordMap.wordMap
    %   wordMap.wordMap = reshape (wordMap.wordMap, h*w, 1);
       L = layerNum-1 ;
       h=[];
       for n=1:layerNum
           l = layerNum-n;  
           noOfCells = 2^l;                 % no of parts in which the wordmap is to be divided
           rowindex = floor(r/noOfCells);
           columnIndex =  floor(c/noOfCells); 
           if l == 0 
               weight = 2^(l- L);
           else 
               weight = 2^(l- L -1);
           end 
           features=[];
           for row = 1:noOfCells
               for column = 1:noOfCells
                   cell = wordMap(1+(row-1)*rowindex:row*rowindex, 1+(column-1)*columnIndex:column*columnIndex);  %can use mat2cell function
                   features = [features ; getImageFeatures(cell, dictionarySize)];
                   
                   % divide the image into parts and then get the normalised imagefeature histogram for all parts
                   % concat for each part
               end
           end        
           h = [h ; features .* weight];
           % concat using the weights for each level
       end
       %normalise histogram
       h=h./sum(h);
      
end