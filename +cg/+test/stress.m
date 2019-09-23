cg.init
M = cg.io.load_off('torus.off');
Z = cg.mg.stress_minimization(M,@cg.dist.geodesic,0.01,0.001);