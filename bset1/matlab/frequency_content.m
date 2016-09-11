[wb, Fs] = audioread('wideband_noise.wav');
[lf, Fs] = audioread('lowfrequency_noise.wav');

sound(wb, Fs);
pause(length(wb)/Fs)
sound(lf, Fs);

fs = linspace(-Fs/2, -Fs/2 * (length(wb)-1)/length(wb), length(wb));
plot(fs,abs(fftshift(fft(wb))), 'b');
plot(fs,abs(fftshift(fft(lf))), 'm');
