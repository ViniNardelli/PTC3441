function zip_out = zip_args(n, varargin)
    arguments
        n {mustBeInteger, mustBePositive}
    end
    arguments (Repeating)
        varargin 
    end
    assert (mod(nargin - 1, n) == 0, '%d is not divisible by %d', nargin, n)
    
    new_args = cell(1, nargin - 1);
    for i = 1:(nargin - 1)/n
        for j = 1:n
            new_args(j+n*(i-1)) = varargin(i+((nargin - 1)/n)*(j-1));
        end
    end
    zip_out = new_args;
end