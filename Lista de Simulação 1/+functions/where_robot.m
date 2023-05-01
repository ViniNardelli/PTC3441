%% WHERE_ROBOT
% Calcula a posição da ferramenta em relação ao sistema da estação a partir
% dos ângulos de junta, comprimentos de ligamento e das descrições do
% sistema da ferramenta (trelw) e do sistema da base do robô (srelb).
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
% |OU Double Matrix| *trels*: Homogeneous Transformation Matrix 4x4
%
%% Hypothesis
% RRR planar robot.

%% Version Control
%
% 1.0; Leonardo da Cunha Menegon, Michel Kagan, Vinícius Nardelli; 01/05/2023; First issue.
%
%% Function
function [trels] = where_robot(theta,trelw,srelb,L)
%% Validity
    arguments
        theta (1,3) {mustBeNumeric, mustBeReal, mustBeFinite}
        trelw {functions.mustBeHomTransfR}
        srelb {functions.mustBeHomTransfR}
        L (1,2) {mustBeNumeric, mustBeReal, mustBeFinite} = [0.5, 0.3]
    end
%% Main Calculations
    wrelb = functions.kin(theta, L);
    brels = functions.tinvert(srelb);
    
    wrels = functions.tmult(brels, wrelb);
    
%% Output Data
    trels = functions.tmult(wrels, trelw);
end

