cg.init
k=300;
M = cg.io.load_off('cat2.off');

[phi, lambda, S, A] = cg.dg.spectral_decomposition(M, k);

scatter(1:k,diag(lambda)')