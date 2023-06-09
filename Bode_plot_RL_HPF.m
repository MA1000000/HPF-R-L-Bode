% Define the coefficients of the numerator and denominator
R = 8046; % Ohms
L = 0.764; % Henrey  
Gm = 0.00220551;
Gds = 0.0000069 ;

numer_val = Gm / (Gds + 1/(R)); % numerator value
denom_val_0 = 1 / (L * (Gds + 1/(R))); % denominator value
% disp(denom_val_0);
% disp(numer_val);

numerator = [numer_val,0];  % Specify the numerator coefficients
denominator = [1,denom_val_0];  % Specify the denominator coefficients

H = tf(numerator, denominator);  % Create the transfer function model

% Define the frequency range
w = logspace(-6, 6, 1000); % Frequency range from 1 to 1000k (10^0 to 10^6)


% Get the frequency response data
[mag, phase, freq] = bode(H,w);

% Convert magnitude to dB
magdB = 20 * log10(squeeze(mag));

% Convert phase to degrees
phase_deg = squeeze(phase);

% Plot the Bode plot (magnitude and phase)
figure;
subplot(2, 1, 1);
semilogx(freq, magdB);
grid on;
xlabel('Frequency (rad/s)');
ylabel('Magnitude (dB)');
title('Bode Plot (Magnitude) of Coil and Resistor in Parallel');

subplot(2, 1, 2);
semilogx(freq, phase_deg);
grid on;
xlabel('Frequency (rad/s)');
ylabel('Phase (degrees)');
title('Bode Plot (Phase) of Coil and Resistor in Parallel');