function I = trapezoidal_method(Function, lower_interval, upper_interval, no_of_intervals)
    % calculate the step-size h
    h = (upper_interval - lower_interval) / no_of_intervals;
    % calculate the x values for the stepsize
    x_vector = lower_interval:h:upper_interval;
    % calculate the values of the function at those x points
    y = Function(x_vector);
    
    I = ((h/2) * (Function(lower_interval) + Function(upper_interval))) + h * sum(y(2:no_of_intervals));   
end