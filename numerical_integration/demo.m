%% clear the memory and screen
clc;
clear;

%% declare the variables
% N = No. of intervals
% a = lower limit
% b = upper limit
N = 10;
a = 0;
b = 10;

%% declare the function
Function = @ (x) (2 .* sin(x) .^ 2 + 5 .* cos(x + 3));

%% arrays for storing the results
rect_results = zeros(1, N);
midpoint_results = zeros(1, N);
trapezoidal_results = zeros(1, N);

%% for number of intervals  from 1 till N, calculate the numerically intgrated value
for i = 1:N
   rect_results(i) = rectangle_method(Function, a, b, i);
   midpoint_results(i) = midpoint_method(Function, a, b, i);
   trapezoidal_results(i) = trapezoidal_method(Function, a, b, i);
end

%% calculate the actual value (Ground Truth)
actual_val = integral(Function, a, b) * ones(1, N);

%% do the plotting with the results
plot(rect_results, '-or'); hold on;
plot(midpoint_results, '-+g'); hold on;
plot(trapezoidal_results, '-.b'); hold on;
plot(actual_val, '-*c'); hold on;
legend("Rectangle Method", "Mid-point Method", "Trapezoidal Method", "Actual Value");
title("A comparison among the numerical integration methods", 'fontsize', 16);
xlabel('Number of Intervals','fontsize',14);
ylabel ('Function Value','fontsize',14);
grid on;
