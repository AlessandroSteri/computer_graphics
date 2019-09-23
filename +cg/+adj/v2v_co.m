function PPT = v2v_co(M)
    P = cg.adj.v2t(M);
    PPT = P * P';
end
