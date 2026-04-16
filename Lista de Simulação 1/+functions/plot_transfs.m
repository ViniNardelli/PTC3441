function plot_transfs(T, name, Tant)
% PLOT_TRANSFS Plota múltiplos sistemas de coordenadas 3D.
%   T: Matriz(es) de transformação homogênea 4x4.
%   name: Nome(s) para exibição nos eixos.
%   Tant: Matriz(es) de referência anterior (origem do deslocamento).

    arguments (Repeating)
        T (4,4) {functions.mustBeHomTransfR}
        name string
        Tant (4,4) {functions.mustBeHomTransfR}
    end
    
    title("Diagrama dos Sistemas de Coordenadas");
    hold on; grid on;
    
    % Define visão isométrica padrão
    az = 135; el = 35.264;
    view(az, el);
    
    % Inicializa limites do gráfico
    limits = [-0.3, 0.3; -0.3, 0.3; -0.3, 0.3];
    
    % Itera sobre cada sistema fornecido
    for i = 1:length(T)
        % Calcula a transformação global 
        current_T = T{i} * Tant{i}; 
        origin_pos = Tant{i}(1:3, 4);
        
        % Renderiza o sistema de coordenadas e atualiza limites
        new_lim = render_axes(current_T, name{i}, origin_pos');
        limits = [min([limits(:,1), new_lim(:,1)], [], 2), ...
                  max([limits(:,2), new_lim(:,2)], [], 2)];
    end
    
    % Marcador na origem global e ajuste de escala
    scatter3(0, 0, 0, '+', 'k');
    apply_equal_aspect(limits);
end

function lim = render_axes(T, label, O)
    % Extrai vetores diretores e translação
    X = T(1:3, 1); Y = T(1:3, 2); Z = T(1:3, 3);
    Pos = T(1:3, 4)';
    
    % Cores padrão (RGB -> XYZ)
    colors = {'#C00', '#070', '#00F'};
    dirs = {X, Y, Z};
    axis_names = {'X', 'Y', 'Z'};
    
    % Desenha vetores e linhas de referência
    current_pt = O; 
    for i = 1:3
        % O ponto de destino para esta perna do caminho é o current_pt 
        % atualizado apenas na coordenada i
        next_pt = current_pt;
        next_pt(i) = Pos(i);
        
        % Calcula o deslocamento real (distância)
        dist = next_pt(i) - current_pt(i);
        
        % Só desenha se houver deslocamento significativo
        if abs(dist) > 1e-5
            % 1. Desenha a linha pontilhada [Início; Fim]
            pts = [current_pt; next_pt];
            line(pts(:,1), pts(:,2), pts(:,3), 'Color', '#888', 'LineStyle', ':');
            
            % 2. Calcula o ponto médio para o texto
            mid_pt = (current_pt + next_pt) / 2;
            
            % 3. Escreve o valor da distância
            text(mid_pt(1), mid_pt(2), mid_pt(3), sprintf(' %.2f', dist), ...
                 'FontSize', 8, 'Color', '#555', 'VerticalAlignment', 'bottom');
        end
        
        % O ponto onde parou agora é o início para o próximo eixo
        current_pt = next_pt;
        
        % Desenha a seta do eixo (Quiver)
        quiver3(Pos(1), Pos(2), Pos(3), dirs{i}(1), dirs{i}(2), dirs{i}(3), 'Color', colors{i});
        
        % Texto em LaTeX
        text_pos = Pos + dirs{i}' * 1.1;
        text(text_pos(1), text_pos(2), text_pos(3), ...
             sprintf('$$\\hat{%s_{%s}}$$', axis_names{i}, label), 'Interpreter', 'latex');
    end
    
    % Calcula limites para esta coordenada
    lim = [min([O; Pos; Pos + X'; Pos + Y'; Pos + Z'], [], 1)', ...
           max([O; Pos; Pos + X'; Pos + Y'; Pos + Z'], [], 1)'];
end

function apply_equal_aspect(lim)
    % Garante que os eixos X, Y e Z tenham a mesma escala visual
    center = mean(lim, 2);
    range = max(lim(:, 2) - lim(:, 1)) / 2;
    xlim([center(1)-range, center(1)+range]);
    ylim([center(2)-range, center(2)+range]);
    zlim([center(3)-range, center(3)+range]);
end