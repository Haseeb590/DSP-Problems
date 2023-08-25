% Simulating synchronization with varying parameters
original_signal = randn(1, 800);
t = 0:0.1:79.9; % Longer signal
received_signal = original_signal .* cos(2*pi*0.03*t + 0.8); % Different frequency and phase

% Estimate phase and frequency offset using cross-correlation
[~, idx] = max(xcorr(original_signal, received_signal));
estimated_offset = (idx - length(original_signal)) / length(original_signal);

% Correct synchronization by removing estimated offset
corrected_signal = received_signal .* exp(-1j*2*pi*estimated_offset*t);

% Plot the signals
figure;
subplot(3, 1, 1);
plot(t, original_signal);
title('Original Signal');

subplot(3, 1, 2);
plot(t, received_signal);
title('Received Signal');

subplot(3, 1, 3);
plot(t, corrected_signal);
title('Corrected Signal');
