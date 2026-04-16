%% WHERE_ROBOT
% Calcula a posição da ferramenta em relação ao sistema da estação a partir
% dos ângulos de junta $\left(\theta\right)$, comprimentos de ligamento $(L)$ e das descrições do
% sistema da ferramenta $\left({}^W_T T\right)$ e do sistema da base do robô $\left({}^B_S T\right)$.
% 
%% Calling Syntax
% trels = where_robot(theta, trelw, srelb, L)
%
%% I/O Variables
% |IN Double Array| *theta*: [theta1 theta2 theta3] [degrees degrees degrees]
% 
% |IN Double Matrix| *trelw*: Homogeneous Transformation Matrix 4x4
%
% |IN Double Matrix| *srelb*: Homogeneous Transformation Matrix 4x4
%
% |IN Double Array| *L*: [l1 l2] [meters meters]
%
% |OUT Double Matrix| *trels*: Homogeneous Transformation Matrix 4x4
%
%% Example
% theta = [30 30 45]
%
% trelw = functions.utoi([1 2 30])
%
% srelb = functions.utoi([-1 3 0])
%
% L = [0.2 0.3]
%
% trels = functions.where_robot(theta,trelw,srelb,L)
%
% trels =
%
%        -0.7071   -0.7071         0   -0.8675
%         0.7071   -0.7071         0   -2.1919
%         0         0         1.0000         0
%         0         0              0    1.0000
%
%
% For more examples, see "../tests/where_robotTest"
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
function [trels] = where_robot(theta,trelw,srelb,L)
%% Validity
    arguments (Input)
        theta (1,3) {mustBeNumeric, mustBeReal, mustBeFinite}
        trelw {functions.mustBeHomTransfR}
        srelb {functions.mustBeHomTransfR}
        L (1,2) {mustBeNumeric, mustBeReal, mustBeFinite} = [0.5, 0.3]
    end
    arguments (Output)
        trels {functions.mustBeHomTransfR}
    end
%% Main Calculations
    wrelb = functions.kin(theta, L);
    brels = functions.tinvert(srelb);
    
    wrels = functions.tmult(brels, wrelb);
    
%% Output Data
    trels = functions.tmult(wrels, trelw);
end
