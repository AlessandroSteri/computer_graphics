cg.init
%M = cg.io.load_off('torus.off');
M = cg.io.load_off(MESHES.torus);




% Approx biharmonic vs Exact
src = 1;
i=1;
figure
h = subplot(2,2,1);
% Exact biharmonic
D_b = cg.pjct.biharmonic_distance(M);
d_b = D_b(:,src);
cg.plot.dist(M, d_b);
title('Exact Biharmonic')  

handls = [h];
for k=[10 50 200]
    i=i+1;
    h = subplot(2,2,i);
    D_b_approx = cg.dist.approx_biharmonic(M,k);
    d_b_approx = D_b_approx(:,src);
    cg.plot.dist(M, d_b_approx);
    handls = [handls h];
    title(k)  
    drawnow
end
cg.plot.rotate(handls, 1/48, 72);

M = cg.io.load_off('tr_reg_031.off');

%SRC
%cg.io.pick_points(M);
p = 3502;


% Exact biharmonic
D_b = cg.pjct.biharmonic_distance(M);
d_b = D_b(:,p);


% Geodesic
D_g = cg.dist.geodesic(M);
d_g = D_g(:,p);

% Biharm vs geodesic
handle = figure;
s1 = subplot(121);
cg.plot.dist(M, d_b);
title('Biharmonic')  

s2 = subplot(122);
cg.plot.dist(M, d_g)
title('Geodesic')  


cg.plot.rotate([s1 s2], 1/48, 720);

% ub = max(max(M.VERT));
% lb = min(min(M.VERT));
%ub-lb, (ub+lb)/2);




%% Noise Biharm vs Geodesic (20 sec each, geodesic few sec)
M_noise_1 = cg.mesh.add_noise(M, 0.0001, 0.0001);
M_noise_2 = cg.mesh.add_noise(M, 0.001, 0.001);
figure
s1 = subplot(231);
%D_b = cg.pjct.biharmonic_distance(M);
%d_b = D_b(:,p);
cg.plot.dist(M, d_b);
title('Biharmonic')  
cg.utils.stand_up(s1)
drawnow

s2 = subplot(232);
d_b_n1 = cg.pjct.biharmonic_distance(M_noise_1);
d_b_n1 = d_b_n1(:,p);
cg.plot.dist(M_noise_1, d_b_n1);
title('Biharmonic low noise')  
cg.utils.stand_up(s2)
drawnow

s3 = subplot(233);
d_b_n2 = cg.pjct.biharmonic_distance(M_noise_2');
d_b_n2 = d_b_n2(:,p);
cg.plot.dist(M, d_b_n2);
title('Biharmonic high noise')  
cg.utils.stand_up(s3)
drawnow


s4 = subplot(234);
%D_g = cg.dist.geodesic(M);
%d_g = D_g(:,p);
cg.plot.dist(M, d_g)
title('Geodesic')  
cg.utils.stand_up(s4)
drawnow


s5 = subplot(235);
d_g_n1 = cg.dist.geodesic(M_noise_1);
d_g_n1 = d_g_n1(:,p);
cg.plot.dist(M_noise_1, d_g_n1)
title('Geodesic low noise')  
cg.utils.stand_up(s5)
drawnow


s6 = subplot(236);
d_g_n2 = cg.dist.geodesic(M_noise_2);
d_g_n2 = d_g_n2(:,p);
cg.plot.dist(M, d_g_n2)
title('Geodesic high noise')  
cg.utils.stand_up(s6)
drawnow

cg.plot.rotate([s1 s2 s3 s4 s5 s6], 1/48, 720);

%% Distances as height normalized
cg.init
seed = 1;
handle = figure;

k = 200;

%M = cg.gen.flat_mesh(50,-50,30);
%M = cg.io.load_off('flat_505030_ccw.off');
M = cg.io.load_off(MESHES.torus);
%M = cg.gen.flat_mesh(20,-20,10)
%crop = 40;

crop = 65;

d_b = cg.pjct.biharmonic_distance(M);
d_b = d_b(:,seed);
d_b = cg.utils.normalize(d_b) .* crop;
M1 = cg.utils.f_as_h(M,d_b);
s1 = subplot(231);
cg.plot.dist(M1, d_b);
title('Biharmonic')  
drawnow

d_c = cg.dist.approx_biharmonic(M, k);
d_c = d_c(:,seed);
d_c = cg.utils.normalize(d_c) .* crop;
M2 = cg.utils.f_as_h(M,d_c);
s2 = subplot(232);
cg.plot.dist(M2, d_c);
title('Approx-Biharm')  
drawnow

d_c = cg.dist.commute(M, k);
d_c = d_c(:,seed);
d_c = cg.utils.normalize(d_c) .* crop;
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
d_h = cg.utils.normalize(d_h) .* crop;
M3 = cg.utils.f_as_h(M,d_h);
s3 = subplot(234);
cg.plot.dist(M3, d_h);
title('Heat Diffiusion 1 / 2') 
drawnow

t = 1 / 20 * lambda_2;
d_h = cg.dist.heat_diffusion(M, k, t);
d_h = d_h(:,seed);
d_h = cg.utils.normalize(d_h) .* crop;
M3 = cg.utils.f_as_h(M,d_h);
s3 = subplot(235);
cg.plot.dist(M3, d_h);
title('Heat Diffiusion 1 / 20') 
drawnow

d_g = cg.dist.geodesic(M, [seed]);
d_g = d_g(:,seed);
d_g = cg.utils.normalize(d_g) .* crop;
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


%cg.test.diffusion