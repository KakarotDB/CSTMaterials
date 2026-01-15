#Reading the audio wave file :

#y = array of audio data
#Fs = sample rate (44.1 Khz)
#[y, Fs] = audioread('audio-sas.wav') <- This how to read an audio file and store it
#For ease of use, the audio data has been stored into a file named 'audio_sas.mat'

load audio_sas.mat
printf("Audio loaded : %d samples at %d Hz.\n", length(y), Fs);

%plotting the audio :
plot(y);
title("The audio waveform:")
xlabel("Sample number");
ylabel("Amplitude");

#Now we can manipulate the data -> 'y' array

y_quiet = y * 0.25; # 25% volume
y_loud = y * 2.0; #200% volume

#Run in command window :
# sound (y, Fs * 2) <- plays at 2x speed
# sound(y, Fs * 0.5) <- plays at 0.5x speed

%---------------------------------------------%

#Adding random noise :

noise_level = 0.05;
noise = noise_level * randn(size(y));
y_noisy = y + noise;

%plot 1 : (original audio waveform)
figure;
subplot(2, 1, 1);
plot(y);
title("Original audio");
xlabel("Sample number");
ylabel("Amplitude");
drawnow;

%plot 2 : (Noisy audio)
subplot(2, 1, 2);
plot(y_noisy);
title("Noisy audio");
xlabel("Sample number");
ylabel("Amplitude");
drawnow;

%---------------------------------------------%

#Finding frequency components of the audio

if(size(y, 2) > 1)
	y_mono = mean(y, 2);
else
	y_mono = y;
end

#Plotting frequency components of the original audio
N = length(y_mono);
Y_fft = fft(y_mono);
P2 = abs(Y_fft / N);
P1 = P2(1:N/2+1);
P1(2:end -1) = 2 * P1(2:end-1);
f_axis = Fs * (0:(N/2)) / N;

figure;
subplot(2, 1, 1);
plot(f_axis, P1);
title('Frequency Spectrum of the audio');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([0, 15000]);

if(size(y_noisy, 2) > 1)
	y_mono = mean(y_noisy, 2);
else
	y_mono = y;
end

#Plotting frequency components of the audio with noise
N = length(y_mono);
Y_fft = fft(y_mono);
P2 = abs(Y_fft / N);
P1 = P2(1:N/2+1);
P1(2:end -1) = 2 * P1(2:end-1);
f_axis = Fs * (0:(N/2)) / N;

subplot(2, 1, 2);
plot(f_axis, P1);
title('Frequency Spectrum of the audio with noise');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
#xlim([0, 15000]);

%---------------------------------------------%

#Filtering the noisy audio

cutoff_frequency = 4000; #4kHz cutoff frequency
nyquist_freq = Fs / 2; #The highest possible frequency

%Designing 4th order low-pass filter
[b, a] = butter(4, cutoff_frequency / nyquist_freq, 'low');
y_filtered = filter(b, a, y_noisy);

#play result in command line :
#sound(y_noisy, Fs)
#sound(y_filtered, Fs)

#The filtered audio sounds more muffled, thus being the tradeoff for filtering the noise
#(noise level becomes lower)
