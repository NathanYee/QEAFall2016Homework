function y = three_point_moving_average(x)

% make a vector y to store the resulf of the moving average
y = zeros(size(x)); 

% compute the first sample, assuming the previous sample is zero
y(1) = 1/3*(x(1) + x(2));

% compute the 3 pt. moving average of the rest of the samples 
for n = 2:length(x)-1
    y(n) = 1/3*(x(n-1)+x(n)+x(n+1));
end

% Compute the last sample outside the for loop to because there wont be an
% x(n+1), lets assume it is zero here

y(length(x)) = 1/3*(x(length(x)-1) + x(length(x)));



