%% ITOU
% Converte o formato interno (matriz de transformação homogênea) de um 
% manipulador RRR planar para o formato do usuário
% $(x, y, \theta)$
% 
%% Calling Syntax
% uform = itou(iform)
%
%% I/O Variables
% |IN Double Matrix| *iform*: _Internal form_  Homogeneous Transformation Matrix 4x4
%
% |OUT Double Array| *uform*: _User form_  [x y theta] [meters meters degrees]
%
%% Example
% iform = [0 -1  0  1;
%          1  0  0  2;
%          0  0  1  0;
%          0  0  0  1]
% uform = itou(iform)
% 
% uform =
% 
%     1  2  90
%
% For more examples, see "../tests/itouTest"
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
function [uform] = itou(iform) 
%% Vality
    arguments (Input)
        iform (4, 4) {functions.mustBeHomTransfR}
    end
    
    arguments (Output)
        uform (1, 3) {mustBeNumeric, mustBeReal, mustBeFinite}
    end
    
%% Main Calculation
    x = iform(1, 4);
    y = iform(2, 4);
    theta = atan2d(iform(2, 1), iform(1, 1));
    
%% Output Data
    uform = [x, y, theta];
end