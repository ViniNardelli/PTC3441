%% Exercício 4
% Dadas as definições de sistema:
%%
% 
% $$\hspace{0cm}^{U}_{A}T = [x, y, \theta] = [11, -1, 30],$$
%%
% 
% $$\hspace{0cm}^{B}_{A}T = [x, y, \theta] = [0, 7, 45],$$
%%
% 
% $$\hspace{0cm}^{C}_{U}T = [x, y, \theta] = [-3, -3, -30].$$
%%
%
% Desenhe um diagrama desses sistemas e imprima
% $\hspace{0cm}^{B}_{C}T$ 
% nas representações do usuário e interna.
%% Version Control
%
% 1.0; Leonardo da Cunha Menegon, Michel Kagan, Vinícius Nardelli; 01/05/2023; First issue.
%  
%% Main Calculations
arelu = functions.utoi([11, -1, 30]);
arelb = functions.utoi([0, 7, 45]);
urelc = functions.utoi([-3, -3, -30]);

urela = functions.tinvert(arelu);
crelu = functions.tinvert(urelc); 

urelb = functions.tmult(arelb,urela);
crelb = functions.tmult(urelb,crelu);
 
%% $\hspace{0cm}^{B}_{C}T$ na representação interna
display(crelb)
%  
%% $\hspace{0cm}^{B}_{C}T$ na representação do usuário
display(functions.itou(crelb))

%% Diagrama
functions.plot_transfs(eye(4), 'A', eye(4), ...
                       arelu, 'U', eye(4), ...
                       arelb, 'B', eye(4), ...
                       urelc, 'C', arelu)
