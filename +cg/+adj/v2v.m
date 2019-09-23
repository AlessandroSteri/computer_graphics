function A = v2v(M)
    A = sparse( [M.TRIV(:, 1); M.TRIV(:, 2); M.TRIV(:, 3)], ...
                [M.TRIV(:, 2); M.TRIV(:, 3); M.TRIV(:, 1)], ...
                1, M.n, M.n, 3 * M.m);
    % For non closed manifold
    A = logical(A + A');
end
