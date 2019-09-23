cg.init
M = cg.io.load_off('cat2.off');
A = cg.dg.voronoi_areas(M);
[~,~,A_gt] = scripts.calc_LB_FEM(M);
all(cg.utils.equal(A,A_gt))
all(all(cg.utils.equal(diag(A),A_gt)))