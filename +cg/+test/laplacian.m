cg.init
M = cg.io.load_off('cat2.off');
[S,A] = cg.dg.calc_LB_FEM(M);
[S_gt,~,A_gt] = scripts.calc_LB_FEM(M);

all(all(cg.utils.equal(A,A_gt)))
all(all((S == S_gt)))

