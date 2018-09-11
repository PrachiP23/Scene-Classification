function [filterBank, dictionary] = getFilterBankAndDictionary(imPaths)
% Creates the filterBank and dictionary of visual words by clustering using kmeans.

% Inputs:
%   imPaths: Cell array of strings containing the full path to an image (or relative path wrt the working directory.
% Outputs:
%   filterBank: N filters created using createFilterBank()
%   dictionary: a dictionary of visual words from the filter responses using k-means.
 % TODO Implement your code here

    filterBank  = createFilterBank();
    k=150;
    alpha=100;

    imResponses=[];
for i=1:length(imPaths)
    img = imread(imPaths{i});
%     img= imread(strcat(imPaths(i).folder, '\', imPaths(i).name));
    sz=size(img);
    filterResponse = extractFilterResponses(img, filterBank);
    sizeResponse = size(filterResponse);
    filterResponse= reshape(filterResponse, [sizeResponse(1)*sizeResponse(2) sizeResponse(3)]);
%   randomPixels = [randperm(sz(1),alpha),randperm(sz(2),alpha)];
    randomPixels = randperm(sz(1)*sz(2),alpha);
    imResponses = [imResponses; filterResponse(randomPixels,:)]; 
end
   [~, dictionary] = kmeans(imResponses, k, 'EmptyAction', 'drop'); 
   

end
