% Sample the sinusoid x = sin(2*pi*f*t), where f = 1 kHz, and plot the sampled signals over the continuous-time signal.
% Let x1 be the signal sampled at fs1 = 10 kHz .
% Let x2 be the signal sampled at fs2=5 kHz.
  
f = 1000;% Frequency of x(t)
T = 1/f;% Time period of x(t)
tmin = 0;% Time interval minimum value for display
tmax = 5*T;% Time interval minimum value for display
dt = T/100;
dt1 = 1/2000;% Sampling period of 1/10000 sec
dt2 = 1/1000;% Sampling period of 1/5000 sec
t = tmin:dt:tmax; %Time span for x(t)
t1 = tmin:dt1:tmax; %Time span for x(t)sampled at at every 1/10000 sec
t2 = tmin:dt2:tmax;%Time span for x(t)sampled at at every 1/5000 sec
x = cos(2*pi*f*t);% Signal x(t)
x1 = cos(2*pi*f*t1);% Samples at fs1
x2 = cos(2*pi*f*t2);% Samples at fs2
subplot(211)
plot(t,x,'r');% Plot original signal in RED
hold on
stem(t1,x1);% On the same plot draw the samples at every 1/10000 sec
subplot(212)
plot(t,x,'r');% Plot original signal in RED
hold on
stem(t2,x2);% On the same plot draw the samples at every 1/5000 sec

