function PTP = t2t(M)
    P = cg.adj.v2t(M);
    PTP = P' * P;
end
