function p = predictKNN(ytrain, IDX)
%PREDICT Predict whether the label is 0 or 1 using learned knnsearch IDX
%   p = predictKNN(ytrain, IDX) computes the predictions for X using a 
%   mean(ytrain(IDX) >= 0.5, predict 1)
%   Coded by HUANG D.J.
%   Last modified 2016.10.13

m = size(IDX, 1); % Number of training examples

% You need to return the following variables correctly
p = zeros(m, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned logistic regression parameters. 
%               You should set p to a vector of 0's and 1's
%

for i = 1:m
    h = mean(ytrain(IDX(i,:)));
    if h >= 0.5
        p(i) = 1;
    end
end




% =========================================================================


end