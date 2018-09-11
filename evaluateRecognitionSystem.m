function [conf] = evaluateRecognitionSystem()
% Evaluates the recognition system for all test-images and returns the confusion matrix

	load('vision.mat');
	load('../data/traintest.mat');
    
	% TODO Implement your code here
   
    conf=zeros(8);
    for n=1:length(test_imagenames)
        i = test_labels(n);
        guessedImage = guessImage(strcat('../data/',test_imagenames{n})); 
        j = find(contains(mapping, guessedImage));
        conf(i,j) = conf(i,j) + 1; 
    end
    accuracy = trace(conf) / sum(conf(:)) *100;
    disp('Accuracy is:');
    disp(accuracy);
end