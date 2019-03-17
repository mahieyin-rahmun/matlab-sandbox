%% clear the memory and screen
clc;
clear;

%% declare the variables
% N = No. of intervals
% a = lower limit
% b = upper limit
N = 50;
a = 0;
b = 10;

%% declare the function
Function = @ (x) (2 .* sin(x) .^ 2 + 5 .* cos(x + 3));

%% arrays for storing the results
rect_results = zeros(1, N);
midpoint_results = zeros(1, N);
trapezoidal_results = zeros(1, N);
simpson_one_third_results = zeros(1, N);

%% for number of intervals  from 1 till N, calculate the numerically intgrated value
for i = 1:N
   rect_results(i) = rectangle_method(Function, a, b, i);
   midpoint_results(i) = midpoint_method(Function, a, b, i);
   trapezoidal_results(i) = trapezoidal_method(Function, a, b, i);
   simpson_one_third_results(i) = simpson_one_third_method(Function, a, b, i);
end

%% calculate the actual value (Ground Truth)
actual_val = integral(Function, a, b) * ones(1, N);

%% do plotting with the results
% convert function handle to string
function_string = strrep(char(Function),'@(x)','');
function_string = strrep(function_string, '.', '');
title_string = sprintf("A comparison among the numerical integration methods for the function \nf(x) = %s", function_string);

% plot the values
plot(rect_results, '-or'); hold on;
plot(midpoint_results, '-+g'); hold on;
plot(trapezoidal_results, '-.b'); hold on;
plot(simpson_one_third_results, '-sm'); hold on;
plot(actual_val, '-*c'); hold on;

legend("Rectangle Method", "Mid-point Method", "Trapezoidal Method", "Simpson's One-Third Method", "Actual Value");

title(title_string, 'fontsize', 16);
xlabel('Number of Intervals','fontsize',14);
ylabel ('Function Value','fontsize',14);

grid on;
