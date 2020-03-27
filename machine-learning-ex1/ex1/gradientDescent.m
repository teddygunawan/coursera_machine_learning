function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %

    
    %% For self reading purpose
    %h1= 0;
    %for i = 1:rows(X),
    %    h1 += ((theta' * X(i,:)') - y(i)) ;
    %endfor
    %
    %
    %h2= 0;
    %for i = 1:rows(X),
    %    h2 += ((theta' * X(i,:)') - y(i)) * X(i, 2);
    %endfor

    %theta(1) -= (h1 / m) * alpha;
    %theta(2) -= (h2 / m) * alpha;

    %% Non vectorized implementation supporting multiple variables
    %hypotheses = zeros(length(theta), 1);
    %for i = 1:length(theta),
    %    for j = 1:rows(X),
    %        hypotheses(i) += ((theta' * X(j,:)') - y(j)) * X(j, i);
    %    endfor
    %endfor
%
    %for i = 1:length(theta),
    %    theta(i) -= (hypotheses(i) / m) * alpha;
    %endfor


    %% Vectorized Implementation supporting multiple variables
    delta = zeros(columns(X), 1);

    for i = 1:length(delta),
        for j = 1:rows(X),
            delta(i) += (((theta' * X(j,:)') - y(j)) * X(j, i)) /m;
        endfor
    endfor
    theta -= (alpha * delta);




    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
