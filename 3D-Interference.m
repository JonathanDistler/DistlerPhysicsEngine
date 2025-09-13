% Amplitudes
Sm1 = 10;
Sm2 = 15;

% Wave numbers (1/m)
k1 = 5;
k2 = 10;

% Angular frequencies (rad/s)
w1 = 2*pi;
w2 = 2.2*pi;

% Phase offsets
phi1 = pi/2;
phi2 = 0;

% Define spatial and temporal grids
x = 1:25;
t = 1:25;
[X,T] = meshgrid(x,t);   %makes a 2d grid of x and t

% Wave functions
S1 = Sm1*cos(k1*X - w1*T + phi1);
S2 = Sm2*cos(k2*X - w2*T + phi2);

% Plot S1
figure;
surf(X,T,S1);
shading interp;
xlabel('x'); ylabel('t'); zlabel('S1-Amplitude');
title('S1 Wave');
grid on;

% Plot S2
figure;
surf(X,T,S2);
shading interp;
xlabel('x'); ylabel('t'); zlabel('S2-Amplitude');
title('S2 Wave');
grid on;

% Plot interference (S1+S2)
figure;
surf(X,T,S1+S2);
shading interp;
xlabel('x'); ylabel('t'); zlabel('S1 + S2 Amplitude');
title('Interference Pattern');
grid on;

