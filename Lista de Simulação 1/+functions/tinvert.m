%% UTOI   
% Realiza a inversão de uma matriz de transformação homogênea:
%
% $$\left({}^B_A T\right)^{-1} = {}^A_B T$$
% 
%% Calling Syntax
% arelb = tinvert(brela)
%
%% I/O Variables
% |IN Double Matrix| *brela*: Homogeneous Transformation Matrix 4x4
% 
% |OUT Double Matrix| *arelb*: Homogeneous Transformation Matrix 4x4
%
%% Example
%  brela = [0 -1 0 1;
%           1  0 0 0;
%           0  0 1 0;
%           0  0 0 1];
%  arelb = tinvert(brela)
%
% arelb =
% 
%      0     1     0     0
%     -1     0     0     1
%      0     0     1     0
%      0     0     0     1
%
% For more examples, see "../tests/tinvertTest"
%
%% Hypothesis
% RRR planar robot.
%
%% Limitations
% MatLab version: >= R2023a
%
%% Version Control
%
% 1.0; Vicente Servio Saraiva Orrú, Vinícius Nardelli Santiago; 2026/04/13;
% First issue.
%     
%% Function
function [arelb] = tinvert(brela)
%% Validity
    arguments (Input)
        brela {functions.mustBeHomTransfR}
    end

    arguments (Output)
        arelb {functions.mustBeHomTRansfR}
    end
    
%% Main Calculations
    R_T = brela(1:3, 1:3)';
    O = brela(1:3, 4);
    
%% Output Data
    arelb = [R_T, -R_T*O;
             0, 0, 0, 1];
end
