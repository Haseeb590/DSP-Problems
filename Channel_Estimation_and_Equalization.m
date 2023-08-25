% Simulating channel estimation and equalization with varying parameters
original_signal = randn(1, 150);
channel_response = [0.8, -0.5, 0.3]; % Different channel response
received_signal = conv(original_signal, channel_response);

% Estimate the channel using correlation-based method
estimated_channel = xcorr(received_signal, original_signal);
estimated_channel = estimated_channel(length(original_signal):end);

% Apply equalization to recover the original signal
equalized_signal = deconv(received_signal, estimated_channel);

% Plot the signals
figure;
subplot(3, 1, 1);
stem(original_signal);
title('Original Signal');

subplot(3, 1, 2);
stem(received_signal);
title('Received Signal');

subplot(3, 1, 3);
stem(equalized_signal);
title('Equalized Signal');
