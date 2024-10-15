close all;
clear all;
clc;

addpath("Api");

[ret_status, sim, clientID] = initializeComm();     % Initialize Communication with CopelliaSim

% Make sure that initialization is succesful
if (ret_status == 0)
    [returnCode, Quad] = getObjectReference(sim, clientID, 'Quadricopter'); % Reference the 'Quadricopter' object in CoppeliaSim as 'Quad' in MATLAB
    [returnCode, quad_pos] = getObjectPosition(sim, clientID, Quad, 1); % Return Quad's position as quad_pos
    t=clock;
    startTime=t(6);
    currentTime=t(6);
    positions = [];
    y = [];
    z = [];
    T = 6; % How long you want to collect the data for

    while (currentTime-startTime < T)
        if(sim.simxGetConnectionId(clientID) ~= -1)
            t = clock;  % Read current time
            currentTime = t(6);
            [returnCode, quad_pos] = getObjectPosition(sim, clientID, Quad, 1);
            positions(T) = quad_pos(1);
            y(T) = quad_pos(2);
            z(T) = quad_pos(3);
        end
    end

    % Kill the connection to CopelliaSim
    uninitializeComm(sim, clientID)
    plot3(positions, y, z)
    title('Position of 3D')
    xlabel('X Position')
    ylabel('Y Position')
    zlabel('Z Position')
else
    disp('Unable to connect to CopelliaSim')
end