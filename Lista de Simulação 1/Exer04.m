%% Exercício 4
% Dadas as definições de sistema:
%
% $${}^U_A T = [x, y, \theta] = [11, -1, 30],$$
% 
% $${}^B_A T = [x, y, \theta] = [0, 7, 45],$$
% 
% $${}^C_U T = [x, y, \theta] = [-3, -3, -30].$$
%
% Desenhe um diagrama desses sistemas e imprima
% $${}^B_C T$$
% nas representações do usuário e interna.
%% Version Control
%
% 1.0; Vicente Servio Saraiva Orrú, Vinícius Nardelli Santiago; 2026/04/13;
% First issue.
%  
%% Main Calculations
arelu = functions.utoi([11, -1, 30]);
arelb = functions.utoi([0, 7, 45]);
urelc = functions.utoi([-3, -3, -30]);

urela = functions.tinvert(arelu);
crelu = functions.tinvert(urelc);

urelb = functions.tmult(arelb,urela);
crelb = functions.tmult(urelb,crelu);
 
%% Representação interna
display(crelb)

%% Representação do usuário
display(functions.itou(crelb))
%% Diagrama
functions.plot_transfs(eye(4), 'U', eye(4), ...
                       arelu, 'A', eye(4), ...
                       functions.tinvert(arelb), 'B', arelu, ...
                       crelu, 'C', eye(4))