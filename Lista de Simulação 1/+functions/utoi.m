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
% |OUT Double Matrix| *iform*: _Internal form_  Homogeneous Transformation Matrix 4x4
%
%% Example
%  uform = [1 2 90]
%  iform = utoi(uform)
% 
% iform =
% 
%     0.0000   -1.0000         0    1.0000
%     1.0000    0.0000         0    2.0000
%          0         0    1.0000         0
%          0         0         0    1.0000
%
% For more examples, see "../tests/utoiTest"
%
%% Hypothesis
% RRR planar robot.
%
%% Limitations
% MatLab version: >= R2023a
%
%% Version Control
%
% 1.0; Fábio Fialho; 2014/09/17 ; First issue.
%
% 1.1; Fábio Fialho; 2019/09/12 ; Minor modifications.
%
% 1.2; Vicente Servio Saraiva Orrú, Vinícius Nardelli Santiago; 2026/04/13;
% Add validity, example and tests
% 
%% Function
function [iform] = utoi(uform) 
%% Vality
    arguments (Input)
        uform (1, 3) {mustBeNumeric, mustBeReal, mustBeFinite}
    end
    
    arguments (Output)
        iform (4, 4) {functions.mustBeHomTransfR}
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