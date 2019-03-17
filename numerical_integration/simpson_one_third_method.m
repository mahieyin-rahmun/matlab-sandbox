function I = simpson_one_third_method(Function, lower_interval, upper_interval, no_of_intervals)
    % the number of subintervals must be even, or the no_of_intervals must
    % be odd in order for simpson's one third rule to work
    if mod(no_of_intervals, 2) ~= 0
        no_of_intervals = no_of_intervals + 1;
    end
    
    % calculate the step-size h
    h = (upper_interval - lower_interval) / no_of_intervals;
    % calculate the x values for the stepsize
    x_vector = lower_interval:h:upper_interval;
    % sum up the even indexed x values
    sum_even = sum(Function(x_vector(2:2:no_of_intervals)));
    % sum up the odd indexed x values
    sum_odd = sum(Function(x_vector(3:2:no_of_intervals-1)));

    % find the numerical value of integration
    I = (h/3) * (Function(lower_interval) + 4 * sum_even + 2 * sum_odd + Function(upper_interval));
end