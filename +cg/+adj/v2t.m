function P = v2t(M)
    P = sparse( M.TRIV(:), [1:M.m 1:M.m 1:M.m], 1, M.n, M.m);
end
