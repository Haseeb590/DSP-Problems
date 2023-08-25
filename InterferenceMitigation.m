% Simulating interference mitigation with varying parameters
t = linspace(0, 1, 1000);
signal = sin(2*pi*8*t) + sin(2*pi*25*t); % Different frequencies
noisy_signal = signal + 0.15*randn(1, 1000); % Higher noise level

% Apply a moving average filter for interference cancellation
filter_length = 25; % Filter length
adapted_signal = zeros(size(noisy_signal));

for n = filter_length:length(noisy_signal)
    interference_estimate = mean(adapted_signal(n-filter_length+1:n)); % Moving average
    adapted_signal(n) = noisy_signal(n) - interference_estimate;
end

% Plot the signals
figure;
subplot(3, 1, 1);
plot(t, signal);
title('Original Signal');

subplot(3, 1, 2);
plot(t, noisy_signal);
title('Noisy Signal');

subplot(3, 1, 3);
plot(t, adapted_signal);
title('Adapted Signal');
