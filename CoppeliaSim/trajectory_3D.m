close all;
clear all;
clc;

addpath("Api")

[ret_status, sim, clientID] = initializeComm();     % Initialize Communication with CopelliaSim

% Make sure that initialization is succesful
if (ret_status == 0)
    [returnCode, target] = getObjectReference(sim, clientID, 'Quadricopter_target');    % Reference the 'Quadcopter_target' object in CoppeliaSim as 'target' in MATLAB
    
    % Initialize variables
    bool = 0;
    x = []; y = []; z = [];
    T = 1;
    i = 0; j = 0; k = 1;
    
    while(sim.simxGetConnectionId(clientID) ~= -1)
        % Here is an example of setting the target's trajectory to a circle.
        % Each column of the vector corresponds to the x, y, and z coordinate,
        % respectively.
        % Checks if the height is greater than or equal to 3
        if k >= 3
            bool = 1;
        end
        
        x(T) = i;
        y(T) = j;
        z(T) = k;
        position = [ 0.50*cos(i)-0.50, 0.50*sin(j), k];
        i = i + 0.2;
        j = j + 0.2;
        
        % Checks the state of the quadcopter
        if k < 3 && bool == 0   % Increases k if conditions met
            k = k + 0.05;
        elseif k > 1 && bool == 1   % Decreases k if conditions met
            k = k - 0.05;
        end

        T = T + 1;  % Increments time
        [returnCode] = setObjectPosition(sim, clientID, target, position);
        pause(0.15) % This delay will be computer dependent
        
        if k == 1 && bool == 1 % Creates graph at the end
    
            figure(1)
            plot3(x, y, z)
            title('3D Plot of Position')
            xlabel('X Position')
            ylabel('Y Position')
            zlabel('Z Position')
            
            figure(2)
            plot(y, z)
            title('Position in Y and Z')
            xlabel('Y Position')
            ylabel('Z Position')
        end
    end
    
    % Kill the connection to CopelliaSim
    uninitializeComm(sim, clientID)
else
    disp('Unable to connect to CopelliaSim')
end