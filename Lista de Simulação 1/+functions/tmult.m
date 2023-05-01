%% TMULT
% Realiza a multiplicação de duas matrizes de transformação homogênea
% entre si.
% 
%% Calling Syntax
% crela = tmult(brela, crelb)
%
%% I/O Variables
% |IN Double Matrix| *brela*: Homogeneous Transformation Matrix 4x4
%
% |IN Double Matrix| *crelb*: Homogeneous Transformation Matrix 4x4
% 
% |OU Double Matrix| *crela*: Homogeneous Transformation Matrix 4x4
%
%% Example
%  brela = [0 -1 0 1;
%           1  0 0 0;
%           0  0 1 0;
%           0  0 0 1]
%  crelb = [0 -1 0 0;
%           1  0 0 1;
%           0  0 1 0;
%           0  0 0 1]
%  crela = tmult(brela, crelb)
% crela =
% 
%     -1     0     0     0
%      0    -1     0     0
%      0     0     1     0
%      0     0     0     1
%% Version Control
%
% 1.0; Leonardo da Cunha Menegon, Michel Kagan, Vinícius Nardelli; 01/05/2023; First issue.
%     
%% Function
function [crela] = tmult(brela, crelb)
%% Validity
    arguments
        brela {functions.mustBeHomTransfR}
        crelb {functions.mustBeHomTransfR}
    end
    
%% Main Calculations & Output Data
    crela = brela * crelb;
end

