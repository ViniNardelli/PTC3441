%% Exerc�cio 10
% Dados trelw, srelb, os comprimentos dos ligamentos e quatro sistemas
% objetivos na forma do usu�rio, assumir que o rob� inicia com as tr�s
% juntas com �ngulo 0 e ent�o percorre todos os objetivos sequencialmente,
% quando poss�vel.
% 
%% Hypothesis
% RRR planar robot.
%
%% Version Control
%
% 1.0; Leonardo da Cunha Menegon, Michel Kagan, Vin�cius Nardelli; 01/05/2023; First issue.
%  
%% Main Calculations

trelw = functions.utoi([0.1, 0.2, 30.0]);
srelb = functions.utoi([-0.1, 0.3, 0.0]);

current = [0, 0, 0];
L = [0.5, 0.3];
thetalim = [-170, 170; -170, 170; -170, 170];

positions = [0, 0, -90; 0.6, -0.3, 45; -0.4, 0.3, 120; 0.8, 1.4, 30];

for i = 1:4
    goal = positions(i, :);
    [near, far, sol] = functions.solve_robot(goal, current, trelw, srelb, L, thetalim);
    vsol(i) = sol;
    vnear(i, :) = near;
    current = near;
end

for i = 1:4
   if vsol(i) ~= 0
       vwhere(i, :) = functions.itou(functions.where_robot(vnear(i, :), trelw, srelb, L));
   end
end

display(vsol)
display(vnear)
display(vwhere)

