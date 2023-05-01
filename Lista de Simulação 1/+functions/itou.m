%% ITOU
% Converte o formato interno (matriz de transformação homogênea)
% para o formato de saída de dados do usuário
% $(x,y,\theta)$
% para um manipulador RRR planar.
% 
%% Calling Syntax
% uform = itou(iform)
%
%% I/O Variables
% |IN Double Matrix| *iform*: _Internal form_  Homogeneous Transformation Matrix 4x4
%
% |OU Double Array| *uform*: _User form_  [x y theta] [meters meters degrees]
%
%% Example
%  iform = [0 -1 0 1;
%           1  0 0 0;
%           0  0 1 0;
%           0  0 0 1]
%  uform = itou(iform)
% uform =
%
%     1     0    90
%% Hypothesis
% RRR planar robot.
%
%% Version Control
%
% 1.0; Leonardo da Cunha Menegon, Michel Kagan, Vinícius Nardelli; 01/05/2023; First issue.
%     
%% Function
function [uform] = itou(iform)
%% Validity
    arguments
        iform {functions.mustBeHomTransfR}
    end
    
%% Main Calculations
    x = iform(1, 4);
    y = iform(2, 4);
    theta = atan2d(iform(2, 1), iform(1, 1));
    
%% Output Data
    uform = [x, y, theta];
end

