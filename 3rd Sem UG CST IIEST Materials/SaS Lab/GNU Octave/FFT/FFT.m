%Studying FFT function

Fs = 1000; #sample rate: 1000 Hz
t = 0:1/Fs:1-1/Fs; #Time Vector : 1 second long

f1 = 50; #50 Hz sine wave
f2 = 120; #120 Hz sine wave

#Two sin waves of different amplitues (0.7 and 1.0)
x = 0.7 * sin( 2 * pi * f1 * t) + sin(2 * pi * f2 * t);

N = length(x) %number of samples

Y_fft = fft(x);

% Calculate the single-sided spectrum
P2 = abs(Y_fft / N);
P1 = P2(1:N/2+1);
P1(2:end-1) = 2 * P1(2:end-1);

% Create the frequency axis
f_axis = Fs * (0:(N/2)) / N;

%plotting result :
plot(f_axis, P1);
title('Frequency Spectrum of Test Signal');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
xticks(0:50:500);
yticks(0:0.1:1.2);
ylim([0 1.2]);


