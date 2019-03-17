function err = rmse(calculated, actual)
    % squared error
    sum = 0;
    for i = 1:length(calculated)
        sum = sum + (calculated(i) - actual(1)) ^ 2;
    end

    % mean error
    temp_err = sum / length(calculated);

    % root mean squared error
    err = sqrt(temp_err);
end