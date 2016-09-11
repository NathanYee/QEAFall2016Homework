close all

% load example wave file
% The original data was provided by robinhood_76 through Freesound.org
[x_siren, Fs] = audioread('siren_doppler.wav');

% get the sound of the siren as the ambulance approaches (we found the
% right indices for you)
x_init = x_siren(10000:54099);
% normalize
x_init = x_init/rms(x_init);
% get the sound of the siren as the ambulance moves away
x_end = x_siren(220500:264599);
% normalize
x_end = x_end/rms(x_end);

%play the two sounds, scale down by a factor of 10 to not make it too loud
sound(0.1*x_init, Fs);
pause(3)
sound(0.1*x_end, Fs);

freq_indices = linspace(-22e3, 22e3, length(x_init));
plot(freq_indices, abs(fftshift(fft(x_init))));
hold on
plot(freq_indices, abs(fftshift(fft(x_end))));
legend('Approaching', 'Moving away');

