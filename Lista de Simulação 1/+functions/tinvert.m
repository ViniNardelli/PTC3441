%% UTOI   
% Realiza a inversão de uma matriz de transformação homogênea. 
% 
%% Calling Syntax
% arelb = tinvert(brela)
%
%% I/O Variables
% |IN Double Matrix| *brela*: Homogeneous Transformation Matrix 4x4
% 
% |OU Double Matrix| *arelb*: Homogeneous Transformation Matrix 4x4
%
%% Example
%  brela = [0 -1 0 1;
%           1  0 0 0;
%           0  0 1 0;
%           0  0 0 1];
%  arelb = tinvert(brela)
% arelb =
% 
%      0     1     0     0
%     -1     0     0     1
%      0     0     1     0
%      0     0     0     1
%% Version Control
%
% 1.0; Leonardo da Cunha Menegon, Michel Kagan, Vinícius Nardelli; 01/05/2023; First issue.
%     
%% Function
function [arelb] = tinvert(brela)
%% Validity
    arguments
        brela {functions.mustBeHomTransfR}
    end
    
%% Main Calculations
    R_T = brela(1:3, 1:3)';
    O = brela(1:3, 4);
    
%% Output Data
    arelb = [R_T, -R_T*O;
             0, 0, 0, 1];
end

