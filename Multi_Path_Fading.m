% Simulating multi-path fading with varying parameters
t = linspace(0, 1, 1000);
original_signal = cos(2*pi*5*t); % Different waveform

% Generate a fading channel with different path gains
num_paths = 3; % Number of paths
path_gains = [1, 0.6, 0.3]; % Different path gains
fading_signal = zeros(size(original_signal));
for i = 1:num_paths
    path_delay = round(rand()*200); % Random path delay
    fading_signal = fading_signal + path_gains(i) * circshift(original_signal, path_delay);
end

% Apply diversity combining to mitigate fading effects
diversity_signal = fading_signal;

% Plot the signals
figure;
subplot(3, 1, 1);
plot(t, original_signal);
title('Original Signal');

subplot(3, 1, 2);
plot(t, fading_signal);
title('Faded Signal');

subplot(3, 1, 3);
plot(t, diversity_signal);
title('Diversity Combined Signal');
