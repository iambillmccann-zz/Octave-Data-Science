function delta = computeDelta(X, y, theta, j)
%COMPUTEDELTA Compute cost for linear regression
%   delta = COMPUTEDELTA(X, y, theta, j) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
delta = sum ((hypothesis(X, y, theta) - y) .* X(:, j)) ./ m;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.





% =========================================================================

end
