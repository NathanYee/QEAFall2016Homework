% vague model with given differential equations

function res = model
%% clear workspace

clc;
clear;
clf;


%% define constants

% starting conditions
x = 1;
v = 1;

% constants
a = 1;
b = 1;

%time for ode45
time_start = 0; %seconeds
time_end = 2.05;  %seconds


%% ode45 call waterFlow
[T, stocks] = ode45(@flows, [time_start, time_end], [x, v]);


function [res] = flows(t, stocks)
    x = stocks(1);
    v = stocks(2);
    
    dx = v;
    dv = (-a*x) - (b * v^2);2
    
    res = [dx; dv];
end


%% plot figure
hold on
plot(T,stocks(:,1))
plot(T,stocks(:,2))
legend('position', 'velocity')
title('Position over time')


end