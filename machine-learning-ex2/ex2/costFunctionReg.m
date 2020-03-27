function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


hx = sigmoid(theta' * X')';
yIsOne = y' * log(hx);
yIsZero = (1-y)' * log(1 - hx);

J = -(yIsOne + yIsZero )/m;

%% Move theta to another variable tempTheta to not tamper with original theta. 
%% Then set first theta to be 0 since the first theta must not be regularized. Probably should remove instead but too much work 
tempTheta = theta;
tempTheta(1) = 0;
regularizeValue = lambda/(2*m) * sum(tempTheta.^2);
J += regularizeValue;

for i = 1:columns(X),
    for j = 1:rows(X),
        grad(i) += (((hx(j) - y(j)) * X(j,i)) / m);
    end;
    if(i != 1)
        grad(i) +=  (lambda / m) * theta(i);
    endif;
end;




% =============================================================

end;
