function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

            
% You need to return the following values correctly
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative
%               filtering. Concretely, you should first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, you should implement the 
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.
%
% Notes: X - num_movies  x num_features matrix of movie features
%        Theta - num_users  x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the 
%            i-th movie was rated by the j-th user
%
% You should set the following variables correctly:
%
%        X_grad - num_movies x num_features matrix, containing the 
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta
%

% cost function
difference = (X * Theta' - Y);
J = sum((difference .^ 2)(R == 1)) / 2;
J = J + lambda * sum(sum(Theta .^2 )) / 2;  % regularized term of theta.
J = J + lambda * sum(sum(X .^ 2)) / 2; % regularized term of x.

% gradient of x.
for i = 1:num_movies
  idx = find(R(i, :) == 1);    % users that have rated movie i.
  tempTheta = Theta(idx, :); % user features of movie i.
  tempY = Y(i, idx);         % user's ratings of movie i.
  X_grad(i, :) = (X(i, :) * tempTheta' - tempY) * tempTheta;
  X_grad(i, :) = X_grad(i, :) + lambda * X(i, :); % regularized term of x.
end

% gradient of theta.
for j = 1:num_users
  idx = find(R(:, j) == 1)'; % movies that have rated by user j.
  tempX = X(idx, :);       % features of movies rated by user j.
  tempY = Y(idx, j);       % user ratings by user j.
  Theta_grad(j, :) = (tempX * Theta(j, :)' - tempY)' * tempX;
  Theta_grad(j, :) = Theta_grad(j, :) + lambda * Theta(j, :); % regularized term of theta.
end
% =============================================================

grad = [X_grad(:); Theta_grad(:)];

end