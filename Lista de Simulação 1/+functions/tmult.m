%% TMULT
% Realiza a multiplicação de duas matrizes de transformação homogênea
% entre si:
%
% $${}^A_C T = {}^A_B T \cdot {}^B_C T$$
% 
%% Calling Syntax
% crela = tmult(brela, crelb)
%
%% I/O Variables
% |IN Double Matrix| *brela*: Homogeneous Transformation Matrix 4x4
%
% |IN Double Matrix| *crelb*: Homogeneous Transformation Matrix 4x4
% 
% |OUT Double Matrix| *crela*: Homogeneous Transformation Matrix 4x4
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
%
% crela =
% 
%     -1     0     0     0
%      0    -1     0     0
%      0     0     1     0
%      0     0     0     1
%
% For more examples, see "../tests/tmultTest"
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
function [crela] = tmult(brela, crelb)
%% Validity
    arguments (Input)
        brela {functions.mustBeHomTransfR}
        crelb {functions.mustBeHomTransfR}
    end

    arguments (Output)
        crela {functions.mustBeHomTransfR}
    end
    
%% Main Calculations & Output Data
    crela = brela * crelb;
end
