function I = simpson_three_eight_method(Function, lower_interval, upper_interval, no_of_intervals)
    % no of intervals must be divisible by 3
    if mod(no_of_intervals, 3) ~= 0
        no_of_intervals = no_of_intervals + mod(no_of_intervals, 3);
    end
    
    % calculate the step-size h
    h = (upper_interval - lower_interval) / no_of_intervals;
    % calculate the x values for the stepsize
    x_vector = lower_interval:h:upper_interval;
    
    
    sum = Function(lower_interval);
    
    for i = 2:3:no_of_intervals
        sum = sum + 3 * Function(x_vector(i));
    end
    
    for i = 3:3:no_of_intervals
        sum = sum + 3 * Function(x_vector(i));
    end
    
    for i = 4:3:no_of_intervals
        sum = sum + 2 * Function(x_vector(i));
    end
    
    sum = sum + Function(upper_interval);
    
    I = (3 * h / 8) * sum;
    
%     first_sum = sum(Function(x_vector(2:3:(no_of_intervals-1))) + Function(x_vector(3:3:(no_of_intervals-1))));
% 
%     second_sum = sum(Function(x_vector(4:3:(no_of_intervals-2))));
% 
%     % find the numerical value of integration
%     I = (3 * h / 8) * (Function(lower_interval) + 3 * first_sum + 2 * second_sum + Function(upper_interval));
end