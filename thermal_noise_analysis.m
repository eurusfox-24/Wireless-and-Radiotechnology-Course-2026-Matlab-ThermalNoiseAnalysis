% MATLAB Script for Thermal Noise Simulation and Analysis

% --- 1. Parameters ---
B = 1e6;                % Bandwidth: 1 MHz
R = 100;                % Resistance: 100 ohms
T = 300;                % Temperature: 300 K
k = 1.38e-23;           % Boltzmann constant
n_samples = 10000;      % Number of samples

% --- 2. Thermal Noise Generation ---
time = 0 : 1/B : (n_samples-1) / B;
% Formula for noise voltage: sqrt(4 * k * T * R * B)
thermal_noise = sqrt(4 * k * T * R * B) * randn(1, n_samples);

% --- 3. Plotting in Time Domain ---
figure;
subplot(2,1,1);
plot(time, thermal_noise);
title('Thermal Noise in Time Domain');
xlabel('Time (seconds)');
ylabel('Amplitude (Volts)');
grid on;

% --- 4. Power Spectral Density (PSD) Analysis ---
subplot(2,1,2);
[psd, freq] = pwelch(thermal_noise, [], [], [], B);
semilogx(freq, 10*log10(psd));
title('Power Spectral Density (PSD) of Thermal Noise');
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');
grid on;
