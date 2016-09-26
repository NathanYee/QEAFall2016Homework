function [Times, Stocks] = simulate(params)

    y0 = zeros(2,1);
    y0(2) = 10; %

    [Times, Stocks] = ode45(@(t, y) flows(t, y, params), [0, 20], y0);
    
    keyboard
    
end