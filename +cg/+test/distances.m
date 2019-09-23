cg.init
seed = 1;
handle = figure;

k = 200;

%M = cg.utils.create_flat_triangular_mesh(0.1, 0);
%M = cg.io.load_off('torus.off');
%M = cg.gen.flat_mesh(50,-50,30);
%M = cg.io.load_off('flat_505030_ccw.off');
M = cg.io.load_off(MESHES.torus);


d_b = cg.pjct.biharmonic_distance(M);
d_b = d_b(:,seed);
d_b = cg.utils.normalize(d_b) .* 70;
M1 = cg.utils.f_as_h(M,d_b);
s1 = subplot(231);
cg.plot.dist(M1, d_b);
title('Biharmonic')  
drawnow

d_c = cg.dist.approx_biharmonic(M, k);
d_c = d_c(:,seed);
d_c = cg.utils.normalize(d_c) .* 70;
M2 = cg.utils.f_as_h(M,d_c);
s2 = subplot(232);
cg.plot.dist(M2, d_c);
title('Approx-Biharm')  
drawnow

d_c = cg.dist.commute(M, k);
d_c = d_c(:,seed);
d_c = cg.utils.normalize(d_c) .* 70;
M2 = cg.utils.f_as_h(M,d_c);
s2 = subplot(233);
cg.plot.dist(M2, d_c);
title('Commute')  
drawnow



[phi, lambda, S, A] = cg.dg.spectral_decomposition(M, k);
l = diag(lambda);
lambda_2 = l(2);

t = 1 / 2* lambda_2;
d_h = cg.dist.heat_diffusion(M, k, t);
d_h = d_h(:,seed);
d_h = cg.utils.normalize(d_h) .* 70;
M3 = cg.utils.f_as_h(M,d_h);
s3 = subplot(234);
cg.plot.dist(M3, d_h);
title('Heat Diffiusion 1 / 2') 
drawnow

t = 1 / 20 * lambda_2;
d_h = cg.dist.heat_diffusion(M, k, t);
d_h = d_h(:,seed);
d_h = cg.utils.normalize(d_h) .* 70;
M3 = cg.utils.f_as_h(M,d_h);
s3 = subplot(235);
cg.plot.dist(M3, d_h);
title('Heat Diffiusion 1 / 20') 
drawnow

d_g = cg.dist.geodesic(M, [seed]);
d_g = d_g(:,seed);
d_g = cg.utils.normalize(d_g) .* 70;
M4 = cg.utils.f_as_h(M,d_g);
s4 = subplot(236);
cg.plot.dist(M4, d_g);
title('Geodesic')  
drawnow

% lb = 0;
% ub = 2;
% caxis(s1, [lb ub])
% caxis(s2, [lb ub])
% caxis(s3, [lb ub])
% caxis(s4, [lb ub])