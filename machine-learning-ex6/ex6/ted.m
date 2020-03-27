%%% NEED TO RUN ex6_spam FIRST BEFORE THIS CAN RUN AS IT REQUIRE THE SVM MODEL!
filename1 = 'tedEmail1.txt';
filename2 = 'tedEmail2.txt';

% Read and predict
file_contents = readFile(filename1);
word_indices  = processEmail(file_contents);
x             = emailFeatures(word_indices);
p = svmPredict(model, x);

fprintf('\nProcessed %s\n\nSpam Classification: %d\n', filename1, p);
fprintf('(1 indicates spam, 0 indicates not spam)\n\n');

% Read and predict
file_contents = readFile(filename2);
word_indices  = processEmail(file_contents);
x             = emailFeatures(word_indices);
p = svmPredict(model, x);

fprintf('\nProcessed %s\n\nSpam Classification: %d\n', filename2, p);
fprintf('(1 indicates spam, 0 indicates not spam)\n\n');
