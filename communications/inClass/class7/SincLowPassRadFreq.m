function y = SincLowPassRadFreq(x, rad_freq)

wc = rad_freq;

n = [-42:41];
h = wc/pi*sinc(wc*n/pi);
y = conv(x,h, 'same');

end