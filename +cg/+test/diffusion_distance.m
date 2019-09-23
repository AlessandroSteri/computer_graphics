cg.init  
M = cg.io.load_off('deadpool.off');
cg.heat.diff_dst(M);
[M.S, ~, M.A] = scripts.calc_LB_FEM(M);
[M.phi, M.lambda] = eigs(M.S, M.A, 300, -1e-5);
