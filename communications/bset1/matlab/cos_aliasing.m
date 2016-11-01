ToneFreq=440;% Set Tone Frequency
Fs=8000;% Sampling Frequency
Ts=1/Fs;% sampling period
t=0:Ts:1-Ts;%Time interval for generating tone
Tone=cos(2*pi*ToneFreq*t);%Single monotone at 1800 Hz
player = audioplayer(Tone/4,Fs)%Play the t[wb, Fs] = audioread('wideband\_noise.wav')one
play(player);
