cg.init
M = cg.io.load_off('cat0.off');
F = M.VERT;
G = M.VERT;

FG = cg.dg.inner_prod_on_mesh_vec_fields(M,F,G);