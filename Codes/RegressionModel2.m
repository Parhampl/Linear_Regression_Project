% Load your dataset into variables X and Y
close all;
clc;
data = load('data_for_linearregression_tamrin.mat');

% Extract x and y from the loaded data
X = data.x;
Y = data.y;


% Add intercept term to X for bias (b)
X = [ones(length(X), 1), X];

% Initialize parameters for linear regression
theta = zeros(2, 1);  % [b; w]
learning_rate = 0.01;
num_epochs = 10000;
m = length(Y);

% Perform gradient descent
for epoch = 1:num_epochs
    predictions = X * theta;
    errors = predictions - Y;
    gradient = (X' * errors) / m;
    theta = theta - learning_rate * gradient;
end

% After gradient descent, theta(1) is b and theta(2) is w
w = theta(2);
b = theta(1);

% Print the final parameters
fprintf('The value of w (slope) is: %f\n', w);
fprintf('The value of b (y-intercept) is: %f\n', b);

% Plot the data points
scatter(X(:,2), Y, 'filled');
hold on;

% Plot the fitted line
x_line = linspace(min(X(:,2)), max(X(:,2)), 100);  % Generate 100 points between min and max of X
y_line = w*x_line + b;                             % Calculate corresponding y values
plot(x_line, y_line, 'r-', 'LineWidth', 2);        % Plot the line

% Labels and legend
xlabel('X');
ylabel('Y');
title('Linear Regression Fit');
legend('Data Points', 'Fitted Line');

% Release the hold on the current figure
hold off;
