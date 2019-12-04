function h = hypothesis(X, y, theta)
% HYPOTHESIS Compute hypothesis for linear regression
%   h = COMPUTECOST(X, y, theta) computes the hypothesis of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples
h = theta(1) + theta(2) .* X(:,2); % vector of h(x)

% =========================================================================
end
