cg.init
M = cg.io.load_off(MESHES.flat_505030_ccw);
n = cg.mesh.norm(M);
cg.plot.mesh(M)
hold on
cg.plot.arrows_on_mesh(M, n);
