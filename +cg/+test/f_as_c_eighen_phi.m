cg.init
M = cg.io.load_off('torus.off');
k = 100;
[phi, lambda, S, A] = cg.dg.spectral_decomposition(M, k);
%A = cg.dg.voronoi_areas(M);
f = M.VERT(:,1);

figure
cg.plot.dist(M,f);
figure
c = phi' * A * f;
f_phi = phi* c;
cg.plot.dist(M,f_phi);



[~, S] = cg.smpl.fps(M.VERT, 100, 1);
f = cg.smpl.voronoi_euclidean(M.VERT, S); 

figure
cg.plot.dist(M,f);
figure
c = phi' * A * f;
f_phi = phi* c;
cg.plot.dist(M,f_phi);