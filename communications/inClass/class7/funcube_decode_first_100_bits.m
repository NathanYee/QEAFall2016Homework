%close all


% load data to be processed from funcube_telemetry.mat
% the variables in this file are:
%
% y -  8000 samples of the initial portion of a funcube telemetry
%     data packet. This is a snippet from the data from Example 4 from 
%     https://funcube.org.uk/working-documents/telemetry-examples/ 
%     We extracted the portion of the signal which starts with the 
%     32-bit sync marker: 00011010110011111111110000011101 
%
% wc - This is the "carrier frequency" that we estimated (note that this is
%      an intermediate carrier frequency, which is not the true carrier
%      frequency. For simpler processing, the signal which is originally
%      in a frequency range of ~150MHz, is reduced in frequency to a much 
%      lower frequency in analog hardware before being converted into a digital signal.) 
% 
% phase - This is the phase offset of the carrier which we estimated
%
% Fs - This is the sampling frequency
%
%

load funcube_telemetry.mat



% the data rate of the telemetry data of the Funcube is 1200 b/s
% We provided ~100 bits of data in the vector y
samples_per_bit = Fs/1200;
num_bits_per_packet = 100;


% plot the fft of the raw signal to visualize
figure
subplot(311);
f = linspace(-pi,pi*(length(y)-1)/length(y),length(y));
plot(f, abs(fftshift(fft(y))));

title('Original FunCube Signal');
xlabel('Frequency (radians/sample)');
ylabel('Magnitude of DFT of signal');
grid on


% create a time vector for demodulating with a cosine
ns = [0:length(y)-1];

% multiply by a cosine of the appropriate frequency
yc = y.*cos(wc*ns+phase_correction);


% plot the magnitude of the DFT to visualize
% we expect to see 3 blobs here
subplot(312);
f = linspace(-pi,pi*(length(yc)-1)/length(yc),length(yc));
plot(f, abs(fftshift(fft(yc))));

title('FunCube signal multiplied by cosine');
xlabel('Frequency (radians/sample)');
ylabel('Magnitude of DFT of signal');
grid on

% low-pass filter the signal
% by inspecting the previous plot, it is evident that a cutoff frequency of
% 1 radian/sample would work
yc_lpf = SincLowPassRadFreq(yc, 1);


% Again, plot the magnitude of the DFT of the signal
% to visualize
subplot(313);
f = linspace(-pi,pi*(length(yc_lpf)-1)/length(yc_lpf),length(yc_lpf));
plot(f, abs(fftshift(fft(yc_lpf))));

title('FunCube signal multiplied by cosine, and low-pass filtered');
xlabel('Frequency (radians/sample)');
ylabel('Magnitude of DFT of signal');
grid on



%create another time vector equal to the length of yc_lpf
tt = [1:length(yc_lpf)];

figure
%plot the demodulated signal
plot(tt, yc_lpf, '-m', 'LineWidth', 1);
hold on
title('Demodulated Differential BPSK Signal');


% next, on the same axis plot every 80-th point, starting from sample 4
% which we "eyeballed" as the start of the data transmissions
% Recall that the system uses 80 samples per bit
%
% 

first_bit_idx = 4;
% get every 80th point starting from sample 4
demod_sampled_sig = yc_lpf(first_bit_idx:samples_per_bit:end);
% plot every 80th point with a marker
plot(tt(first_bit_idx:samples_per_bit:end), demod_sampled_sig, 'o', 'MarkerFaceColor', 'b');
legend('Demodulated Data', 'Sampled, Demodulated Data');
xlabel('Time (samples)');
grid on

% Now let's decode the bits. The data was differentially encoded, whereby
% a change in the signal value represents a 0, and no change
% represents a 1. You should be able to "eyeball" this by carefully
% inspecting the graph. Here is some code to do this automatically

bits = differential_decode(demod_sampled_sig)