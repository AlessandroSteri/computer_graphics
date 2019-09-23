function [handle] = dist(M, d)
%colormap(monochrome_red(150, 7));
colormap hot
handle = cg.plot.mesh(M, d);
Surf = {M.TRIV,M.VERT};
cg.utils.IsoLine(Surf, d, 20, 'w');
shading interp
colorbar
end
