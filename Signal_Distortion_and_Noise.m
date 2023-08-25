% Simulating signal distortion and noise with varying parameters
t = linspace(0, 1, 1000);
original_signal = sin(2*pi*15*t); % Higher frequency
distorted_signal = original_signal + 0.8*sin(2*pi*40*t); % Stronger distortion
noisy_signal = distorted_signal + 0.2*randn(1, 1000); % Higher noise level

% Apply DSP techniques to mitigate distortion and noise
filtered_signal = filter([1, -0.9], 1, noisy_signal); % Using a simple FIR filter

% Plot the signals
figure;
subplot(3, 1, 1);
plot(t, original_signal);
title('Original Signal');

subplot(3, 1, 2);
plot(t, distorted_signal);
title('Distorted Signal');

subplot(3, 1, 3);
plot(t, noisy_signal);
hold on;
plot(t, filtered_signal, 'r');
title('Noisy and Filtered Signals');
legend('Noisy Signal', 'Filtered Signal');
