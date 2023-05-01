%% UTOI   
% Converte o formato de entrada de dados do usuário
% $(x,y,\theta)$
% para o formato interno (matriz de transformação homogênea)
% para um manipulador RRR planar.
% 
%% Calling Syntax
% iform = utoi(uform)
%
%% I/O Variables
% |IN Double Array| *uform*: _User form_  [x y theta] [meters meters degrees]
% 
% |OU Double Matrix| *iform*: _Internal form_  Homogeneous Transformation Matrix 4x4
%
%% Example
%  uform = [1 0 90]
%  iform = utoi(uform)
% 
% iform =
% 
%     0.0000   -1.0000         0    1.0000
%     1.0000    0.0000         0         0
%          0         0    1.0000         0
%          0         0         0    1.0000
%% Hypothesis
% RRR planar robot.
%
%% Limitations
% A "Forma do usuário" é específica para o exercício de simulação e não tem
% validade para qualquer configuração de robô.
%
%% Version Control
%
% 1.0; Leonardo da Cunha Menegon, Michel Kagan, Vinícius Nardelli; 01/05/2023; First issue.
%     
%% Function
function [iform] = utoi(uform)
%% Validity
    arguments
        uform (1,3) {mustBeNumeric, mustBeReal, mustBeFinite}
    end
    
%% Main Calculations
    x = uform(1);
    y = uform(2);
    theta = uform(3) * pi / 180;
    
%% Output Data
    iform = [cos(theta), -sin(theta), 0, x;
             sin(theta), cos(theta),  0, y;
             0, 0, 1, 0;
             0, 0, 0, 1];
end

