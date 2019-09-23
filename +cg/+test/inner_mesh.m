cg.init
M = cg.io.load_off('cat0.off');
f = M.VERT(:,1);
g = M.VERT(:,2);

fg = cg.dg.inner_prod_on_mesh(M,f,g);