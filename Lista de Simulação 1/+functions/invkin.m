%% INVKIN
% Calcula a cinemática inversa do robô planar RRR tendo como entradas a matriz
% de transformação do punho para a base $\left({}^B_W T\right)$ indicando para onde se deseja levar
% o robô, os valores atuais dos ângulos das juntas, os comprimentos dos
% ligamentos e os limites de operação das juntas do robô.
% 
%% Calling Syntax
% [near, far, sol] = invkin(wrelb, current, L, thetalim)
%
%% I/O Variables
% |IN Double Matrix| *wrelb*: Homogeneous Transformation Matrix 4x4
%
% |IN Double Array| *current*: [theta1 theta2 theta3] [degrees degrees degrees]
% 
% |IN Double Array| *L*: [l1 l2] [meters meters]
%
% |IN Double Matrix| *thetalim*: [lim1n lim1p; lim2n lim2p; lim3n lim3p] [degrees degrees; degrees degrees; degrees degrees]
% 
% |OUT Double Array| *near*: [theta1 theta2 theta3] [degrees degrees degrees]
%
% |OUT Double Array| *far*: [theta1 theta2 theta3] [degrees degrees degrees]
%
% |OUT Double| *sol*: Number of solutions
%
%% Example
% [near, far, sol] = functions.invkin(functions.kin([30 45 60]))
% 
% near =
% 
%    30.0000   45.0000   60.0000
% 
% 
% far =
% 
%    63.1758  -45.0000  116.8242
% 
% 
% sol =
% 
%      2
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
function [near, far, sol] = invkin(wrelb, current, L, thetalim)

%% Validity
arguments (Input)

    wrelb (4,4) {functions.mustBeHomTransfR}
    current (1,3) {mustBeNumeric, mustBeReal, mustBeFinite} = [0, 0, 0]
    L (1,2) {mustBeNumeric, mustBeReal, mustBeFinite} = [0.5, 0.3]
    thetalim (3, 2) {mustBeNumeric, mustBeReal, mustBeFinite} = repmat([-170, 170], 3, 1)

end
arguments (Output)
    near (1,3) {mustBeNumeric, mustBeReal, mustBeFinite}
    far (1,3) {mustBeNumeric, mustBeReal, mustBeFinite}
    sol  (1, 1) {mustBeInteger, mustBeMember(sol, [0, 1, 2])}
end
%% Main Calculations

x = wrelb(1, 4);
y = wrelb(2, 4);
phi = atan2d(wrelb(2, 1), wrelb(1, 1));
soln = 1;
solp = 1;

% Espaço de Trabalho Alcançavel
raio_min = abs(L(1) - L(2));
raio_max = L(1) + L(2);
raio = sqrt(x^2 + y^2);
if (raio_min > raio || raio > raio_max)
    soln = 0;
    solp = 0;
    near = [0 0 0];
    far = [0 0 0];

    % Cálculo das soluções
else
    c2 = (x^2 + y^2 - L(1)^2 - L(2)^2)/(2*L(1)*L(2));
    s2p = sqrt(1 - c2^2);
    s2n = -sqrt(1 - c2^2);
    theta2p = atan2d(s2p, c2);
    theta2n = atan2d(s2n, c2);

    k1 = L(1) + L(2)*c2;
    k2p = L(2)*s2p;
    k2n = L(2)*s2n;
    gamap = atan2d(k2p, k1);
    gaman = atan2d(k2n, k1);

    theta1p = atan2d(y, x) - gamap;
    theta1n = atan2d(y, x) - gaman;

    theta3p = phi - theta1p - theta2p;
    theta3n = phi - theta1n - theta2n;

    vthetap = [theta1p theta2p theta3p];
    vthetan = [theta1n theta2n theta3n];

    % Verificação dos limites de operação das juntas

    if any(thetalim(:, 1) > vthetap') || any(thetalim(:, 2) < vthetap')
        solp = 0;
    end
    if any(thetalim(:, 1) > vthetan') || any(thetalim(:, 2) < vthetan')
        soln = 0;
    end

%% Output Data
    % Nenhuma solução
    if solp == 0 && soln == 0
        near = [0 0 0];
        far = [0 0 0];
    end

    % Uma solução
    if solp == 0 && soln == 1
        near = [theta1n theta2n theta3n];
        far = near;
    end
    if solp == 1 && soln == 0
        near = [theta1p theta2p theta3p];
        far = near;
    end

    % Duas soluções
    if solp == 1 && soln == 1
        diffp = abs(theta1p - current(1)) + abs(theta2p - current(2)) + abs(theta3p - current(3));
        diffn = abs(theta1n - current(1)) + abs(theta2n - current(2)) + abs(theta3n - current(3));
        if diffp < diffn 
            near = [theta1p theta2p theta3p];
            far = [theta1n theta2n theta3n];
        else
            far = [theta1p theta2p theta3p];
            near = [theta1n theta2n theta3n];
        end
    end
end

sol = solp + soln;
end
