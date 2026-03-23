%% UTOI


function [iform] = utoi(uform)
    %UTOI Summary of this function goes here
    %   Detailed explanation goes here
    arguments (Input)
        uform (1, 3) {mustBeNumeric, mustBeReal, mustBeFinite}
    end
    
    arguments (Output)
        iform
    end
    
    %% Main Calculation
    x = uform(1);
    y = uform(2);
    theta = uform(3) * pi / 180;
    
    %% Output Data
    iform = [cos(theta), -sin(theta), 0, x;
             sin(theta), cos(theta),  0, y;
             0, 0, 1, 0;
             0, 0, 0, 1];
end