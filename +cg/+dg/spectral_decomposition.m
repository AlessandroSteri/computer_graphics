function [phi, lambda, S, A] = spectral_decomposition(M, k)
    [S, A] = cg.dg.calc_LB_FEM(M);
    [phi, lambda] = eigs(S, A, k, -1e-5);
end
