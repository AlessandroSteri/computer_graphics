cg.init  
M = cg.io.load_off('deadpool.off');

% plotting
figure(1)
axis off; hold on
%iso_jet = jet;
%iso_jet(1:4:end) = 0;
c_map = lines;
colormap(c_map); colorbar
cg.plot.mesh(M, M.VERT(:,2));
shading interp