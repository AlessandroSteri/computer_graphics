M = cg.io.load_off('bunny.off');

n = 100;
seed = 999;
S_p = scripts.fps_euclidean(M.VERT, n, seed);
[vv , S_my] = cg.smpl.fps(M.VERT, n, seed);
f1 = cg.smpl.voronoi_euclidean(M.VERT, S_p);
f2 = cg.smpl.voronoi_euclidean(M.VERT, S_my);
figure(1)
cg.plot.mesh(M, f1);
figure(2)
cg.plot.mesh(M, f2);
