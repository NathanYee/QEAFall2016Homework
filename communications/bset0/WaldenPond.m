% using ode45 is overkill to do this problem.  
%I want to do it for practice

function res = WaldenPond
%% clear workspace

clc;
clear;
clf;


%% define constants

% starting conditions
waterLevel = 12.9;

% flows in
flowIn = 2.1;
prec = flowIn * .45;
aqui = flowIn * .55;

% flows out
flowOut = 2.1;
evap = flowOut * .26;
seep = flowOut * .74;

%time for ode45
time_start = 0; %years
time_end = 60;  %years


%% update/calculate constants

% update flows in
prec = prec * .75;
flowIn = prec + aqui;


%% ode45 call waterFlow
[T, Y] = ode45(@waterFlow, [time_start, time_end], waterLevel);


function res = waterFlow(t, y)
    res = flowIn - flowOut;
end


%% plot figure
plot(T,Y)
title('Walden Pond water level')


end