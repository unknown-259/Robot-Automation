% Nathan Tran
% Create 4 figures using the data set of the quadrotor drone
close all;
clear all;
clc;

xLine = zeros(size(p_x));   % Initializes value of objective point
yLine = zeros(size(p_y));   % Initializes value of objective point
zLine = 0.7 * ones(size(p_z));  % Initializes value of objective point
subplot(2,2,1)  % Creates first graph
count_x = 1;    % Initialize variable to first index
max_x = length(p_x);    % Initialize variable to length of list

while count_x <= max_x  % Continues while current count is less than updated
    array length
    if p_x(count_x) > 0.2 || p_x(count_x) < -0.2   % Checks if -0.2 < p_x < 0.2
        p_x(count_x) = [];     % Removes an element
        max_x = max_x - 1;     % Reduce num of array by one

        % We don't increment counter because when element is removed,
        % everything after will shift and program could skip over an
        % index
    else
        count_x = count_x + 1; % Counter adds one if in range
    end
end

plot(p_x, 'r--')
hold on
plot(xLine, 'r')
title('Filtered X Data')
xlabel('Distance [m]')
ylabel('Distance [m]')
legend('p_x', 'xLine')

subplot(2,2,2)  % Creates second graph
count_y = 1;    % Initialize variable to first index
max_y = length(p_y);    % Initialize variable to length of list
while count_y <= max_y  % Continues while current count is less than updated
    array length
    if p_y(count_y) > 0.2 || p_y(count_y) < -0.2   % Checks if -0.2 < p_x < 0.2
        p_y(count_y) = [];     % Removes an element
        max_y = max_y - 1;     % Reduce num of array by one
    else
        count_y = count_y + 1;     % Counter increments if in range
    end
end

plot(p_y, 'b--')
hold on
plot(yLine, 'b')
axis([0 800 -0.05 0.2])
title('Filtered Y Data')
xlabel('Distance [m]')
ylabel('Distance [m]')
legend('p_y', 'yLine')

subplot(2,2,3)  % Creates third graph
count_z = 1; % Initialize variable to first index
max_z = length(p_z);    % Initialize variable to length of list
while count_z <= max_z  % Continues while current count is less than updated
    array length
    if p_z(count_z) > 0.2 || p_z(count_z) < -0.2   % Checks if -0.2 < p_x < 0.2
        p_z(count_z) = [];     % Removes an element
        max_z = max_z - 1;     % Reduce num of array by one
    else
        count_z = count_z + 1;     % Counter increments if in range
    end
end

plot(p_z, 'g--')
hold on
plot(zLine, 'g')
title('Filtered Z Data')
xlabel('Distance [m]')
ylabel('Distance [m]')
legend('p_z', 'zLine')
subplot(2, 2, 4)    % Creates fourth graph
plot(p_x, 'r--')
hold on
plot(p_y, 'b--')
plot(p_z, 'g--')
plot(xLine, 'r')
plot(yLine, 'b')
plot(zLine, 'g')
title('All Filtered Data')
xlabel('Distance [m]')
ylabel('Distance [m]')
legend('p_x', 'p_y', 'p_z', 'xLine', 'yLine', 'zLine')