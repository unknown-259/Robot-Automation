close all;
clear all;
clc;

% Plot two figures corresponding to the position and velocity along with
% three subplots for each plot

% Plot ODE first
time_window = [0, 5];   % Simulation horizon
i_c = [1; 0;];  % Initial conditions
[t,x] = ode45(@myODE, time_window, i_c, F=0);   % Calling the ODE solve

% Plot Forward_Euler
t_0 = 0;    % Initial time
t_f = 5;    % Final time
N=10;   % Number of time steps
i_c = [0; 0;];  % Initial conditions

%Time step
delta = (t_f-t_0)/N;    % Time step
T(1) = t_0;
X(:,1) = i_c;
F = 1;

% For loop, sets next (t,x) values
for k=1:N
    T(k+1) = T(k) + delta;  % Updates our time t according to the step size delta
    X(:,k+1) = X(:,k) + delta*myODE(t(k),X(:,k), F);    % Calls the function f(t,x) = dx/dt
end

% Plots of our simulation
figure(1);
subplot(2, 2, 1);
[t,x] = ode45(@myODE, time_window, i_c, F=1);
plot(t,x(:,1));
hold on
plot(T,X(1,:), '*');
xlabel('Time t');
ylabel('x');
title('ODE Ascend')
legend('x')

F = 0;
% For loop, sets next (t,x) values
for k=1:N
    T(k+1) = T(k) + delta;  % Updates our time t according to the step size delta
    X(:,k+1) = X(:,k) + delta*myODE(t(k),X(:,k), F);    % Calls the function f(t,x) = dx/dt
end

subplot(2, 2, 2);
[t,x] = ode45(@myODE, time_window, i_c, F=0);
plot(t,x(:,1));
hold on
plot(T,X(1,:), '*');
xlabel('Time t');
ylabel('x');
title('ODE Hover')
legend('x')

F = -1;
% For loop, sets next (t,x) values
for k=1:N
    T(k+1) = T(k) + delta;  % Updates our time t according to the step size delta
    X(:,k+1) = X(:,k) + delta*myODE(t(k),X(:,k), F);    % Calls the function f(t,x) = dx/dt
end

subplot(2, 2, 3);
[t,x] = ode45(@myODE, time_window, i_c, F=-1);
plot(t,x(:,1));
hold on
plot(T,X(1,:), '*');
xlabel('Time t');
ylabel('x');
title('ODE Descend')
legend('x')

F = 1;
for k=1:N   % For loop, sets next (t,x) values
    T(k+1) = T(k) + delta;  % Updates our time t according to the step size delta
    X(:,k+1) = X(:,k) + delta*myODE(t(k),X(:,k), F);    % Calls the function f(t,x) = dx/dt
end

figure(2);
subplot(2, 2, 1);
[t,x] = ode45(@myODE, time_window, i_c, F=1);
plot(t,x(:,2));
hold on
plot(T,X(2,:), '*');
xlabel('Time t');
ylabel('v_x');
title('ODE Ascend')
legend('v_x')

F = 0;
% For loop, sets next (t,x) values
for k=1:N
    T(k+1) = T(k) + delta;  % Updates our time t according to the step size delta
    X(:,k+1) = X(:,k) + delta*myODE(t(k),X(:,k), F);    % Calls the function f(t,x) = dx/dt
end

subplot(2, 2, 2);
[t,x] = ode45(@myODE, time_window, i_c, F=0);
plot(t,x(:,2));
hold on
plot(T,X(2,:), '*');
xlabel('Time t');
ylabel('v_x');
title('ODE Hover')
legend('v_x')

F = -1;
% For loop, sets next (t,x) values
for k=1:N
    T(k+1) = T(k) + delta;  % Updates our time t according to the step size delta
    X(:,k+1) = X(:,k) + delta*myODE(t(k),X(:,k), F);    % Calls the function f(t,x) = dx/dt
end

subplot(2, 2, 3);
[t,x] = ode45(@myODE, time_window, i_c, F=-1);
plot(t,x(:,2));
hold on
plot(T,X(2,:), '*');
xlabel('Time t');
ylabel('v_x');
title('ODE Descend')
legend('v_x')