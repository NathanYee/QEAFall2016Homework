clf
load handel
sound(y/max(abs(y)), Fs)

x=fft(y);
z=ifft(x);
hold on

plot(y)
plot(z)