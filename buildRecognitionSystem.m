function buildRecognitionSystem()
% Creates vision.mat. Generates training features for all of the training images.

	load('dictionary.mat');
	load('../data/traintest.mat');
    filterBank  = createFilterBank();
    layerNum=3;
    dictionarySize= length(dictionary);
%     trainImages = traintest.train_imagenames;
%      train_labels = train_labels;
%     features = zeros((dictionarySize*(4^(layerNum)-1)/3), length(trainImages));
    train_features=[];
	% TODO create train_features
    for i =1:length(train_imagenames)
        i
        wordMap = load(strcat('../data/', strrep(train_imagenames{i},'.jpg','.mat')));
        train_features = [train_features, getImageFeaturesSPM(layerNum, wordMap.wordMap, dictionarySize)];
    end

	save('vision.mat', 'filterBank', 'dictionary', 'train_features', 'train_labels');

end