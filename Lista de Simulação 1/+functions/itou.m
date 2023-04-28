function [uform] = itou(iform)
    arguments
        iform {functions.mustBeHomTransfR}
    end
    x = iform(1, 4);
    y = iform(2, 4);
    theta = atan2d(iform(2, 1), iform(1, 1));
    uform = [x, y, theta];
end

