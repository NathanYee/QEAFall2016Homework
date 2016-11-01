%% Visualizing tones

disp('We start with visualizing what a single sinusoid looks like in time and in frequency')

close all
clear


% set a nominal sampling frequency
% this one is convenient because we were able to obtain an audio sample
% of a piano with the appropriate frequency which we will use shortly


samp_freq = round(44100/8);

% create a vector of time samples for ~ 1s 
t = [0:1/samp_freq:2];

% create a tone of 440 Hz
x_tone = 0.25*cos(2*pi*440*t);

% play the tone
sound(x_tone, samp_freq);



% create a vector for the frequency samples we are about to compute
f = linspace(-samp_freq/2, samp_freq/2, length(x_tone));

% take the fast fourier transform of the tone
X_freq = fftshift(fft(x_tone));
% plot to visualize

subplot(2,1,1)

plot(t,x_tone)
xlabel('time')
ylabel('pressure')
title('A Pure Tone')
subplot(2,1,2)

plot(f,abs(X_freq), '.-m');

xlabel('Frequency Hz')


pause;

hold on

%% Now we will examine a piano playing the same note

% read a recording of a piano playing the same note
% this file was downsampled from a file from ramas26 
% uploaded to Freesound.org

[x_piano, Fs] = audioread('pianoA_ramas26.wav');

t_piano = [1:length(x_piano)]/Fs;
% play the piano recording
sound(x_piano, Fs);

% create a vector for the frequency samples we are about to compute
f = linspace(-Fs/2, Fs/2, length(x_piano));

% take the FFT
X_freq = fftshift(fft(x_piano));
%plot to visualize
figure

subplot(2,1,1)

plot(t_piano,x_piano)
xlabel('time')
ylabel('pressure')
title('A piano note')
subplot(2,1,2)
plot(f,abs(X_freq), 'b');
xlabel('Frequency Hz')

%label the graphs
legend('Spectrum of piano note');
grid on

% you should see several harmonics of 440 Hz, i.e. tones at integer
% multiples of 440 Hz. 
% these harmonics help provide richness to the sound from the piano

pause

%%  Create your own "piano"

% the relative heights of the harmonics in the FFT plot helps capture
% some of the richness of the sound of the piano
%
% another thing that helps define the sound of the piano is 
% the envelope of the signal
% to help visualize, plot the piano signal


% first create a vector representing the sampling times
t = [1:length(x_piano)]/Fs;

% Now if you look at the envelope of the piano, it kind of looks like a cosine
% for t<0.5, and almost zero after that.  Let's use that as the envelope...

env=(cos(t*2*pi)+1).*(t<0.5)+0.1;



%% Now we are ready to simulate a piano
% create a new vector that is made up of your sums of cosines multiplied
% by the envelope

% this is the fundamental frequency
f_fund = 440;

% create a bunch of harmonics with the scale factors we gave you above
x_tones = cos(2*pi*f_fund*t) + 0.2*cos(2*pi*2*f_fund*t) ...
    + (35/300)*cos(2*pi*3*f_fund*t)+ (12/300)*cos(2*pi*4*f_fund*t);

x_new = x_tones.*(env(1:length(x_tones)));

% hear what it sounds like
sound(x_new, Fs);

% Make a plot
figure
subplot(2,1,1)
plot(t,x_new)
xlabel('time')
ylabel('synthesized pressure')
title('Synthesized piano note')

%finally look at the frequency content of the synthesized signal
f = linspace(-Fs/2, Fs/2, length(x_new));

% take the FFT
X_freq = fftshift(fft(x_new));

subplot(2,1,2)
plot(f,abs(X_freq), 'b');
xlabel('Frequency Hz')
legend('Spectrum of synthesized piano note')