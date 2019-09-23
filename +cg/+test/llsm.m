cg.init

%M = cg.gen.flat_mesh(50,-50,30);

M = cg.io.load_off(MESHES.torus);
[anchors, ~] = cg.smpl.fps(M.VERT, 20, 1);
cg.plot.mesh(M)
figure
[N] = cg.mesh.least_square(M, anchors)
cg.plot.mesh(N)