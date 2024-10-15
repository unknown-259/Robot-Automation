close all;
clear all;
clc;

addpath("Api")

[ret_status, sim, clientID] = initializeComm();     % Initialize Communication with CopelliaSim

% Make sure that initialization is succesful
if (ret_status == 0)
    [returnCode, target] = getObjectReference(sim, clientID, 'Quadricopter_target');    % Reference the 'Quadcopter_target' object in CoppeliaSim as 'target' in MATLAB
    
    % Initialize variables
    x = []; z = [];
    T = 1; i = 0; k = 1;
    bool = 0;

    while(sim.simxGetConnectionId(clientID) ~= -1)
        % Here is an example of setting the target's trajectory to a circle.
        % Each column of the vector corresponds to the x, y, and z coordinate,
        % respectively.
        % Checks if height is greater than or equal to 3
        if k >= 3
            bool = 1;
        end

        x(T) = i; z(T) = k;
        % Controls movement of quadcoptor
        if i < 2 && bool == 0   % Moves in x direction
            i = i + 0.2;
        elseif k < 3 && bool == 0   % Moves in z direction
            k = k + 0.2;
        elseif i > 0.2 && bool == 1     % Moves in x direction
            i = i - 0.2;
        elseif k > 1 && bool == 1   % Moves in z direction
            k = k - 0.2;
        end

        position = [ 0.50*cos(i)-0.50, 0.50*sin(0), k];
        T = T + 1;  % Increments time
        [returnCode] = setObjectPosition(sim, clientID, target, position);
        pause(0.15)     % This delay will be computer dependent

        if k == 1 && bool == 1  % Creates graph at the end
            % Creates points for y position
            y = zeros(1, T-1);
            plot3(x, y, z)
            title('3D Plot of Position')
            xlabel('X Position')
            ylabel('Y Position')
            zlabel('Z Position')
        end
    end
    
    % Kill the connection to CopelliaSim
    uninitializeComm(sim, clientID)
else
    disp('Unable to connect to CopelliaSim')
end