function [L] = graph_laplacian(M)
    A = cg.adj.v2v(M);
    %L = spdiags(sum(A,2), 0, M.n, M.n) - A;
    D = sum(A,2);
    L = A .* (-1 ./ D);
    L(1:(M.n+1):end) = ones(M.n,1);
end

