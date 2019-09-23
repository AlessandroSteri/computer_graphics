function [handle] = mesh(M, varargin)
    handle = trisurf(M.TRIV, M.VERT(:, 1), M.VERT(:, 2), M.VERT(:, 3), varargin{:});
    cg.plot.opt(handle)
end
