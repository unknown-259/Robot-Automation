close all;
clear all;
clc;

% Simulate a 1D quadrotor that stars at 0, then ascends, hovers, and descends
% Plot ODE

% Simulation horizon
time_window1 = [0, 5];
time_window2 = [5, 10];
time_window3 = [10, 15];

i_c = [1; 0;];  % Initial conditions

figure(1);
[t,x] = ode45(@myODE, time_window1, i_c, F=1);  % Calling the ODE for ascend
plot(t,x(:,1));
hold on
[t,x] = ode45(@myODE, time_window2, i_c, F=0;   % Calling the ODE for hover
plot(t,x(:,1));
[t,x] = ode45(@myODE, time_window3, i_c, F=-1;  % Calling the ODE for descend
plot(t,x(:,1));
xlabel('Time t');
ylabel('x');
title('Position')
legend('x')

figure(2);
% Calling the ODE solve
[t,x] = ode45(@myODE, time_window1, i_c, F=1); % Calling the ODE for ascend
plot(t,x(:,2));
hold on
[t,x] = ode45(@myODE, time_window2, i_c, F=0); % Calling the ODE for hover
plot(t,x(:,2));
[t,x] = ode45(@myODE, time_window3, i_c, F=-1); % Calling the ODE for descend
plot(t,x(:,2));
xlabel('Time t');
ylabel('v_x');
legend('v_x')
title('Velocity')
