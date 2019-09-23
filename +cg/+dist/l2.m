function D = l2(M)
    if isstruct(M)
        M = M.VERT;
    end;  
    D = pdist(M);
    D = squareform(D);
end
