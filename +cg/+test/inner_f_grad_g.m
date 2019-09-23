cg.init
M = cg.io.load_off('torus.off');

f = M.VERT(:,1);
%g = M.VERT(:,1);
g = ones(M.n,1); % grad of constant iscg zero.


I_f_Dg = cg.dg.inner_f_grad_g(M,f,g);

cg.utils.equal(0, I_f_Dg)