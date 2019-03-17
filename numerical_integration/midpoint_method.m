function I = midpoint_method(Function, lower_interval, upper_interval, no_of_intervals)
    % calculate the step-size h
    h = (upper_interval - lower_interval) / no_of_intervals;
    % calculate the x values for the stepsize
    x_vector = lower_interval:h:upper_interval;
    
    %% midpoint method specifies that the x values should be 
    % {x(i) + x(i+1)} / 2    
    y = zeros(1, no_of_intervals);
    
    for i = 1:no_of_intervals
        temp_x = (x_vector(i) + x_vector(i + 1)) / 2;
        y(i) = Function(temp_x);
    end    
    
    %% calculate the numerical value of the integration
    I = h * sum(y);
end