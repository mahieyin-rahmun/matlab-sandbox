%% clear the memory and screen
clc;
clear;

%% declare the variables
% N = No. of intervals
% a = lower limit
% b = upper limit
N = 100;
a = 0;
b = 10;

%% declare the function
% Function = @ (x) 2 .* sin(x) .^ 2 + 5 .* cos(x + 3);
% Function = @ (x) 2 .* x .^ 2 + 5 .* x + 3;
Function = @ (x) 1 ./ (1 + x .^ 2);

%% arrays for storing the results
rect_results = zeros(1, N);
midpoint_results = zeros(1, N);
trapezoidal_results = zeros(1, N);
simpson_one_third_results = zeros(1, N);
simpson_three_eight_results = zeros(1, N);


%% arrays for storing errors
rect_errors = zeros(1, N);
midpoint_errors = zeros(1, N);
trapezoidal_errors = zeros(1, N);
simpson_one_third_errors = zeros(1, N);
simpson_three_eight_errors = zeros(1, N);

%% calculate the actual value (Ground Truth)
actual_val = integral(Function, a, b) * ones(1, N);

%% for number of intervals  from 1 till N, calculate the numerically intgrated value
for i = 1:N
   % calculate integration value
   rect_results(i) = rectangle_method(Function, a, b, i);
   midpoint_results(i) = midpoint_method(Function, a, b, i);
   trapezoidal_results(i) = trapezoidal_method(Function, a, b, i);
   simpson_one_third_results(i) = simpson_one_third_method(Function, a, b, i);
   simpson_three_eight_results(i) = simpson_three_eight_method(Function, a, b, i);
    
   % calculate percentage error
   rect_errors(i) = (abs(actual_val(i) - rect_results(i))) * 100 / actual_val(i);
   midpoint_errors(i) = (abs(actual_val(i) - midpoint_results(i))) * 100 / actual_val(i);
   trapezoidal_errors(i) = (abs(actual_val(i) - trapezoidal_results(i))) * 100 / actual_val(i);
   simpson_one_third_errors(i) = (abs(actual_val(i) - simpson_one_third_results(i))) * 100 / actual_val(i); 
   simpson_three_eight_errors(i) = (abs(actual_val(i) - simpson_three_eight_results(i))) * 100 / actual_val(i);
end

%% do plotting with the results

% convert function handle to string
function_string = strrep(char(Function),'@(x)','');
function_string = strrep(function_string, '.', '');

title_string = sprintf("A comparison among the numerical integration methods for the function \nf(x) = %s", function_string);

% plot the calculated values
figure(1);
plot(rect_results, '-or'); hold on;
plot(midpoint_results, '-+g'); hold on;
plot(trapezoidal_results, '-.b'); hold on;
plot(simpson_one_third_results, '-sm'); hold on;
plot(simpson_three_eight_results, '-db'); hold on;
plot(actual_val, '-*c'); hold on;

legend("Rectangle Method", "Mid-point Method", "Trapezoidal Method", "Simpson's One-Third Method", "Simpson's Three-Eight Method", "Actual Value");

title(title_string, 'fontsize', 16);
xlabel('Number of Intervals','fontsize',14);
ylabel ('Function Value','fontsize',14);

grid on;

%% Percentage Error
figure(2);
plot(rect_errors, '-or'); hold on;
plot(midpoint_errors, '-+g'); hold on;
plot(trapezoidal_errors, '-.b'); hold on;
plot(simpson_one_third_errors, '-sm'); hold on;
plot(simpson_three_eight_errors, '-db'); hold on;

legend("Rectangle Method", "Mid-point Method", "Trapezoidal Method", "Simpson's One-Third Method", "Simpson's Three-Eight Method");

title_string = sprintf("Comparison of Errors for the function \nf(x) = %s", function_string);

title(title_string, 'fontsize', 16);
xlabel('Number of Intervals', 'fontsize', 14);
ylabel ('Percentage Error', 'fontsize', 14);

grid on;


%% RMSE Bar chart
title_string = sprintf("RMSE Error Comparison, \nNo. of intervals = %.0f, \nf(x) = %s", N, function_string);
errs = [];
errs = [errs, rmse(rect_results, actual_val)];
errs = [errs, rmse(midpoint_results, actual_val)];
errs = [errs, rmse(trapezoidal_results, actual_val)];
errs = [errs, rmse(simpson_one_third_results, actual_val)];
errs = [errs, rmse(simpson_three_eight_results, actual_val)];

figure(3)
x_axis = categorical({char("Rectangle Method"), char("Mid-point Method"), char("Trapezoidal Method"), char("Simpson's One-Third Method"), char("Simpson's Three-Eight Method")});
bar(x_axis, errs, 0.5);
title(title_string, 'fontsize', 16);
xlabel("Method Names", 'fontsize', 16);
ylabel("Root Mean Squared Error", 'fontsize', 16);

grid on;