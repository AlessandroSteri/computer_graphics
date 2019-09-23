function N_hat_avg = avg_norm(M)
    n_hat = cg.mesh.norm(M);
    PTP = cg.adj.t2t(M);
    T_adj = PTP & PTP;
    T_adj = T_adj - eye(M.m); %so not to sum itself norm
    N_tot = (T_adj * n_hat);
    N_hat_avg = inv(diag(cg.utils.sum_row(T_adj))) * N_tot;
end