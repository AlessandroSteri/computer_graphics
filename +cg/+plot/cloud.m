function handle = cloud(V, varargin)
    if isstruct(V)
        V = V.VERT
    end

    if nargin == 1
        handle = scatter3(V(:, 1), V(:, 2), V(:, 3), 30, 'r', 'o');
    else
        handle = scatter3(V(:, 1), V(:, 2), V(:, 3), varargin{:});
    end

    cg.plot.opt(handle)
end
