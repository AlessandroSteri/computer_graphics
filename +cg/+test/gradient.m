cg.init
M = cg.io.load_off('cat0.off');

% Gradient of constant 1
f = ones(M.n, 1);
G1 = cg.dg.gradient(M, f);
G2 = meshproc.gradient(M, f);


all(all(cg.utils.equal(G1, G2)))


% Integral of constant rndm funct
f = rand(M.n,1);

G1 = cg.dg.gradient(M, f);
G2 = meshproc.gradient(M, f);


all(all(cg.utils.equal(G1, G2)))


