% Load the data from the .mat file
close all;
clc;
data = load('data_for_linearregression_tamrin.mat');

% Extract x and y from the loaded data
x = data.x;
y = data.y;

% Split the data into training, validation, and test sets
n = length(x);
train_ratio = 0.7;
val_ratio = 0.15;
test_ratio = 0.15;

train_idx = 1:round(train_ratio * n);
val_idx = (train_idx(end) + 1):round((train_ratio + val_ratio) * n);
test_idx = (val_idx(end) + 1):n;

x_train = x(train_idx);
y_train = y(train_idx);

x_val = x(val_idx);
y_val = y(val_idx);

x_test = x(test_idx);
y_test = y(test_idx);

% Perform linear regression on the training set
X_train = [ones(length(x_train), 1), x_train];
w = inv(X_train' * X_train) * X_train' * y_train;

% Print the weights (slope) and bias (intercept)
disp('Weights (Slope):');
disp(w(2));
disp('Bias (Intercept):');
disp(w(1));

% Predictions on the training set
y_train_pred = X_train * w;

% Predictions on the validation set
X_val = [ones(length(x_val), 1), x_val];
y_val_pred = X_val * w;

% Predictions on the test set
X_test = [ones(length(x_test), 1), x_test];
y_test_pred = X_test * w;

% Plot original data and predictions on the training set
figure;
plot(x_train, y_train, 'bo', x_train, y_train_pred, 'r-', 'LineWidth', 2);
xlabel('X values');
ylabel('Y values');
title('Linear Regression - Training Set');
legend('Original Data', 'Linear Regression Line', 'Location', 'best');

% Plot original data and predictions on the validation set
figure;
plot(x_val, y_val, 'bo', x_val, y_val_pred, 'r.');
xlabel('X values');
ylabel('Y values');
title('Linear Regression - Validation Set');
legend('Original Data', 'Predictions');

% Plot original data and predictions on the test set
figure;
plot(x_test, y_test, 'bo', x_test, y_test_pred, 'r.');
xlabel('X values');
ylabel('Y values');
title('Linear Regression - Test Set');
legend('Original Data', 'Predictions');
