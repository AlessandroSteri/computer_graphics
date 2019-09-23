cg.init
M = cg.io.load_off('cat0.off');

% Integral of constant 1
f = ones(M.n, 1);
I1 = cg.dg.integral_of_funct(M, f);
I2 = meshproc.mesh_integral(M, f);
I3 = cg.dg.integral_of_f_voronoi(M, f);


%Surface area of the mesh
totA = cg.mesh.calc_tot_surface(M);

cg.utils.equal(totA, I1)


cg.utils.equal(I1, I2)
cg.utils.equal(I3, I2)

% Integral of constant rndm funct
f = rand(M.n,1);
I1 = cg.dg.integral_of_funct(M, f);
I2 = meshproc.mesh_integral(M, f);
I3 = cg.dg.integral_of_f_voronoi(M, f);

cg.utils.equal(I1, I2)
cg.utils.equal(I3, I2)




