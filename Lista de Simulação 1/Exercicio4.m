% $$$$
urela = functions.utoi([11, -1, 30]);
brela = functions.utoi([0, 7, 45]);
crelu = functions.utoi([-3, -3, -30]);

arelu = functions.tinvert(urela);
urelc = functions.tinvert(crelu);

brelc = brela*arelu*urelc;
display(brelc)
display(functions.itou(brelc))

functions.plot_transfs(functions.utoi([0, 0, 0]), 'A', functions.utoi([0, 0, 0]), ...
                       urela, 'U', functions.utoi([0, 0, 0]), ...
                       brela, 'B', functions.utoi([0, 0, 0]), ...
                       crelu, 'C', urela)