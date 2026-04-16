%% Exercício 7
% Os sistemas da ferramenta e da estação são definidos pelo usuário da
% seguinte forma
%%
% 
% $${}^W_T T = [x, y, \theta] = [0.1, 0.2, 30.0],$$
%%
% 
% $${}^B_S T = [x, y, \theta] = [-0.1, 0.3, 0.0],$$
%%
%
% Calcule a posição e a orientação da ferramenta com relação ao sistema
% da estação para as três seguintes configurações (em graus) do braço:
%%
% 
% 1. $$[\theta_{1}, \theta_{2}, \theta_{3}] = [0.0, 90.0, -90.0];$$
%%
% 
% 2. $$[\theta_{1}, \theta_{2}, \theta_{3}] = [-23.6, -30.3, 48];$$
%%
% 
% 3. $$[\theta_{1}, \theta_{2}, \theta_{3}] = [130.0, 40.0, 12.0].$$
%% Hypothesis
% RRR planar robot.
%% Limitations
% MatLab version: >= R2023a
%% Version Control
%
% 1.0; Vicente Servio Saraiva Orrú, Vinícius Nardelli Santiago; 2026/04/16;
% First issue.
%
%% Main Calculations

% Declaration
trelw = functions.utoi([0.1 0.2 30]);
srelb = functions.utoi( [-0.1 0.3 0]);

%% Primeira Configuração
theta1 = [0 90 -90];
trels1 = functions.where_robot(theta1, trelw, srelb);
display(functions.itou(trels1))

%% Segunda Configuração
theta2 = [-23.6 -30.3 48];
trels2 = functions.where_robot(theta2, trelw, srelb);
display(functions.itou(trels2))

%% Terceira Configuração
theta3 = [130 40 12];
trels3 = functions.where_robot(theta3, trelw, srelb);
display(functions.itou(trels3))