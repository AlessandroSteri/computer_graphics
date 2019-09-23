cg.init
M = cg.io.load_off('torus.off');
L = cg.mesh.graph_laplacian(M);
all(sum(L,1)' == sum(L,2))
all(cg.utils.equal(sum(L),0))