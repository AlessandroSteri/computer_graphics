cg.init
M = cg.io.load_off('cat0.off');

% Norm of constant 1
f = ones(M.n, 1);
G1 = cg.dg.gradient(M, f);
N1 = (dot(G1, G1,2)).^(1/2);
N2 = cg.dg.grad_norm(M, f);
all(cg.utils.equal(N1, N2))


% Norm of constant rndm funct
f = rand(M.n,1);

G1 = cg.dg.gradient(M, f);
N1 = (dot(G1, G1,2)).^(1/2);
N2 = cg.dg.grad_norm(M, f);
all(cg.utils.equal(N1, N2))