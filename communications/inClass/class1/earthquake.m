%% 
% The file QUAKE.MAT contains 200Hz data from the 
% October 17, 1989 Loma Prieta earthquake in the Santa Cruz Mountains. 
% The data are courtesy of Joel Yellin at the Charles F. Richter 
% Seismological Laboratory, University of California, Santa Cruz. 
%
% This data is provided by Mathworks


% Start by loading the data.
% this provides accelerometer data that measures accelaration inthe
% East-West, North-South and Vertical directions
% The data are sampled at 200Hz. 
%


% load the data for the accelerometers measuring East-West, and North-South
% directions
close all

load quake e n 

% create a vector containing the time samples
% when the accelarometer data were recorded
t = [1:length(e)]/200;

subplot(211)
plot(t, e)
title('East-West Accelaration');
subplot(212)
plot(t, n)
title('North-South Accelaration');
pause;
%% 

figure

% create a vector of frequencies 
f = linspace(-100, 100, length(e));

subplot(211)
plot(f, fftshift(abs(fft(e))))
xlabel('Hz');
ylim([0, 6e5]);
grid on
title('East-West Accelaration in the frequency Domain');
subplot(212)
plot(f, fftshift(abs(fft(n))))
ylim([0, 6e5]);
xlabel('Hz');
title('North-South Accelaration in the Frequency Domain');
grid on
