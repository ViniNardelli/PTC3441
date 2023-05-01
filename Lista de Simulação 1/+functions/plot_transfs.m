function plot_transfs(T, name, Tant)
    arguments (Repeating)
        T {functions.mustBeHomTransfR}
        name string
        Tant {functions.mustBeHomTransfR}
    end
    
    title("Diagrama dos Sistemas ")
    new_args = functions.zip_args(3, T{:}, name{:}, Tant{:});
    plot_view(135, 35.264, new_args{:})
    

    
end

function plot_view(az, el, T, name, Tant)
    arguments
        az {mustBeNumeric, mustBeReal, mustBeFinite}
        el {mustBeNumeric, mustBeReal, mustBeFinite}
    end
    arguments (Repeating)
        T {functions.mustBeHomTransfR}
        name string
        Tant {functions.mustBeHomTransfR}
    end
    view(az, el)
    
    switch az
        case 0
            if (el == 90)
                view_map = 1;
            else
                view_map = 2;
            end
        case 90
            view_map = 3;
        case 135
            view_map = 4;
    end
    
    hold on
    lim = [-0.3, 0.3; -0.3, 0.3; -0.3, 0.3];
    for i = 1:(nargin / 3)
        new_T =  functions.tmult(T{i}, Tant{i});
        new_O = Tant{i}(1:3, 4);
        new_lim = plot_coord(view_map, new_T, name(i), new_O);
        lim = [min([lim(:, 1), new_lim(:, 1)], [], 2), ...
               max([lim(:, 2), new_lim(:, 2)], [], 2)];
    end
    
    scatter3(0, 0, 0, '+', 'k')
     
    xlabel('X')
    ylabel('Y')
    zlabel('Z')
    
    range = max(lim(:, 2)-lim(:, 1));
    
    xlim([(lim(1,2) + lim(1,1) - range)/2, (lim(1,2) + lim(1,1) + range)/2])
    ylim([(lim(2,2) + lim(2,1) - range)/2, (lim(2,2) + lim(2,1) + range)/2])
    zlim([(lim(3,2) + lim(3,1) - range)/2, (lim(3,2) + lim(3,1) + range)/2])
end

function [lim] = plot_coord(view, T, name, O)
    arguments
        view {mustBeInteger, mustBeLessThanOrEqual(view, 4),...
              mustBeGreaterThanOrEqual(view, 1)}
        T (4, 4) {functions.mustBeHomTransfR}
        name string
        O (1, 3)
    end
    x = T(1:3, 1);
    y = T(1:3, 2);
    z = T(1:3, 3);
    To = T(1:3, 4);
    
    if (view ~= 3)
        if (To(1) - O(1) ~= 0)
            line([O(1), To(1)], [O(2), O(2)], [O(3), O(3)], ...
                 'Color', '#888', 'LineStyle', ':')
            text((To(1) + O(1)) / 2, O(2), O(3) + .1, string(abs(To(1) - O(1))), ...
                 'Color','#888')
        end
        quiver3(To(1), To(2), To(3), x(1), x(2), x(3), 'Color', '#C00')
        text(1.1 * (To(1) + x(1)), To(2) + x(2), To(3) + x(3), ...
             sprintf('$$\\hat{X_%s}$$', name),'Interpreter', 'latex')
    end
    if (view ~= 2)
        if (To(2) - O(2) ~= 0)
            line([To(1), To(1)], [O(2), To(2)], [O(3), O(3)], ...
                 'Color', '#888', 'LineStyle', ':')
            text(To(1), (To(2) + O(2)) / 2, O(3) + .1, string(abs(To(2) - O(2))), ...
                 'Color','#888')
        end
        quiver3(To(1), To(2), To(3), y(1), y(2), y(3), 'Color', '#070')
        text(To(1) + y(1), 1.1 * (To(2) + y(2)), To(3) + y(3), ...
             sprintf('$$\\hat{Y_%s}$$', name),'Interpreter', 'latex')
    end
    if (view ~= 1)
        if (To(3) - O(3) ~= 0)
            line([To(1), To(1)], [To(2), To(2)], [O(3), To(3)], ...
                 'Color','#888','LineStyle',':')
            text(To(1), To(2) + O(2) + .1, (To(3) + O(3)) / 2, string(abs(To(3) - O(3))), ...
                 'Color','#888')
        end
        quiver3(To(1), To(2), To(3), z(1), z(2), z(3), 'Color', '#00F')
        text(To(1) + z(1), To(2) + z(2), 1.2 * (To(3) + z(3)), ...
             sprintf('$$\\hat{Z_%s}$$', name),'Interpreter', 'latex')
    end
     
    lim = [min([O(1), To(1), 1.1 * (To(1) + x(1));
                O(2), To(2), 1.1 * (To(2) + y(2));
                O(3), To(3), 1.2 * (To(3) + z(3))], [], 2), ...
           max([O(1), To(1), 1.1 * (To(1) + x(1));
                O(2), To(2), 1.1 * (To(2) + y(2));
                O(3), To(3), 1.2 * (To(3) + z(3))], [], 2)];
end