%% KIN
% Calcula a cinemática do robô planar RRR tendo como entrada os valores dos
% ângulos de junta e dos comprimentos dos ligamentos, ou seja, a matriz de
% transformação homogênea do punho em relação a base a partir de theta
% (ângulos de junta) e de L (comprimentos dos ligamentos).
% 
%% Calling Syntax
% wrelb = kin(theta, L)
%
%% I/O Variables
% |IN Double Array| *theta*: [theta1 theta2 theta3] [degrees degrees
% degress]
%
% |IN Double Array| *L*: [l1 l2] [meters meters]
%
% |OU Double Matrix| *wrelb*: Homogeneous Transformation Matrix 4x4
%
%% Example
% theta = [30 30 45]
% L = [0.2 0.3]
% wrelb = kin(theta, L)
%
% wrelb =
% 
%    -0.2588   -0.9659         0    0.3232
%     0.9659   -0.2588         0    0.3598
%          0         0    1.0000         0
%          0         0         0    1.0000
%% Hypothesis
% RRR planar robot.
%
%% Limitations
%
%% Version Control
%
% 1.0; Leonardo da Cunha Menegon, Michel Kagan, Vinícius Nardelli; 01/05/2023; First issue.
%     
%% Function
function [wrelb] = kin(theta, L)
%% Validity
    arguments
        theta (1,3) {mustBeNumeric, mustBeReal, mustBeFinite}
        L (1,2) {mustBeNumeric, mustBeReal, mustBeFinite} = [0.5, 0.3]
    end
%% Main Calculations
    t1 = theta(1) * pi / 180;
    t2 = theta(2) * pi / 180;
    t3 = theta(3) * pi / 180;
    
    L1 = L(1);
    L2 = L(2);
    
%% Output Data
    wrelb = [cos(t1+t2+t3), -sin(t1+t2+t3), 0, L1*cos(t1)+L2*cos(t1+t2);
             sin(t1+t2+t3),  cos(t1+t2+t3), 0, L1*sin(t1)+L2*sin(t1+t2);
             0, 0, 1, 0;
             0, 0, 0, 1];
end

