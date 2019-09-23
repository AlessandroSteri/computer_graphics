cg.init
seed = 1;
handle = figure

k = 200;


%M = cg.io.load_off('torus.off');
%M = cg.io.load_off('flat_505030.off');
M = cg.io.load_off(MESHES.torus);


[phi, lambda, S, A] = cg.dg.spectral_decomposition(M, k);
l = diag(lambda);
lambda_2 = l(2);

handls = [];
i = 1;

for t_abs=[1/1000 1/100 6 8 10 100]
    %ii = floor(10/t_abs);
    %jj = mod(10,t_abs);
    t = t_abs % / 2* lambda_2;
    d_h = cg.dist.heat_diffusion(M, k, t);
    d_h = d_h(:,seed);
    %d_h = cg.utils.normalize(d_h) .* 70;
    M3 = cg.utils.f_as_h(M,d_h*1000);
    h = subplot(2,3, i);
    handls = [handls h];
    cg.plot.dist(M3, d_h);
    title(t_abs) 
    %colorbar off
    drawnow
    i = i+1;
end;


