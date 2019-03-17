function I = rectangle_method(Function, lower_interval, upper_interval, no_of_intervals)
    % calculate the step-size h
    h = (upper_interval - lower_interval) / no_of_intervals;
    % calculate the x values for the stepsize
    x_vector = lower_interval:h:upper_interval;
    % calculate the function values at those x points
    y = Function(x_vector);
    
    % rectangle method formula
    I = h * sum(y);
end