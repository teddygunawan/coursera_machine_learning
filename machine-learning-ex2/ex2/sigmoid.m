function g = sigmoid(z)
%SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).


%for i = 1:columns(z),
%    for j = 1:rows(z),
%        g(j, i) = 1/(1 + exp(-z(j, i)));
%    endfor;
%endfor;

%% 1 / 1(+ exp(-z))
g = exp(-z);
g = 1 ./ (1 + g);

% =============================================================

end
