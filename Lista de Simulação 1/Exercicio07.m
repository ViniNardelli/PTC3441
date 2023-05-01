%% Exercício 7
% Os sistemas da ferramenta e da estação são definidos pelo usuário da
% seguinte forma
%%
% 
% $$\hspace{0cm}^{W}_{T}T = [x, y, \theta] = [0.1, 0.2, 30.0],$$
%%
% 
% $$\hspace{0cm}^{B}_{S}T = [x, y, \theta] = [-0.1, 0.3, 0.0],$$
%%
%
% Calcule a posição e a orientação da ferramenta com relação ao sistema
% da estação para as três seguintes configurações (em graus) do braço:
%%
% 
% $$[\theta_{1}, \theta_{2}, \theta_{3}] = [0.0, 90.0, -90.0],$$
%%
% 
% $$[\theta_{1}, \theta_{2}, \theta_{3}] = [-23.6, -30.3, 48],$$
%%
% 
% $$[\theta_{1}, \theta_{2}, \theta_{3}] = [130.0, 40.0, 12.0],$$
%% Hypothesis
% RRR planar robot.
%% Version Control
%
% 1.0; Leonardo da Cunha Menegon, Michel Kagan, Vinícius Nardelli; 01/05/2023; First issue.
%  
%% Main Calculations
 
% Declaration
theta1 = [0 90 -90];
theta2 = [-23.6 -30.3 48];
theta3 = [130 40 12];
trelw = functions.utoi([0.1 0.2 30]);
srelb = functions.utoi( [-0.1 0.3 0]);
L = [0.5 0.3];

%% Primeira Configuração
trels1 = functions.where_robot(theta1, trelw, srelb, L);
display(functions.itou(trels1))

%% Segunda Configuração
trels2 = functions.where_robot(theta2, trelw, srelb, L);
display(functions.itou(trels2))

%% Terceira Configuração
trels3 = functions.where_robot(theta3, trelw, srelb, L);
display(functions.itou(trels3))