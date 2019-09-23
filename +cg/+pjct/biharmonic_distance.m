function D = biharmonic_distance(M, seeds)
%read mesh from the off file if is not a struct
if ~isstruct(M)
    M = cg.io.load_off(M);
end;    
% all pairs if no seed is given
if nargin < 2
    seeds = (1:M.n)';
end

tic;

%% Cotangent Laplatian FEM
% Lc is our stiffness
[Lc,A_vor] = cg.dg.laplacian_FEM(M);
%where Laplacian Ld = inv(A)*Lc

%% Discretize Delta^2_(x) * $g(x,y)*f(y)dy = f(x)
% as          Ld^2        *  g*A*f         = f
% and solve for g so:
% g = pinv(Lc*inv(A)*Lc) //Full eigen decomposition -> Inefficient
% j-th column of g -> g_j == unique solition of lin. eq.:
% Lc*inv(A_vor)*Lc*y = J_j s.t. sums to 0 => 1' * y = 0


%LEFT hand side:
Lc_Ainv_Lc = Lc*inv(A_vor)*Lc;

%make the first row&col of A zeros, this forces the first entry of
%the solution vector to be zero; takes care of inf many solns
% set albitraty row and column i to 0 and intersection i,i to 1
rndm = 1;
Lc_Ainv_Lc(rndm, :) = zeros(1,M.n);
Lc_Ainv_Lc(:, rndm) = zeros(M.n,1);
Lc_Ainv_Lc(rndm, rndm) = 1;


%RIGHT hand side:
J = eye(M.n) - (1/M.n)* ones(M.n,M.n);
J(rndm,:) = zeros(1, M.n);
J = J(1:M.n,seeds);

%solve the now invertible system
x = full(Lc_Ainv_Lc\J); % is the solution to the equation Lc_Ainv_Lc * x = J
% discrete green function for the bi-laplatian: g_d
y = x - repmat(sum(x)/M.n,M.n,1); % shift the solution so that add up to zero (-avg), but weighted

% matrix of the g(i,j) for the seeds
g = y(seeds,:);

%% Compute exact biharmonic distances:
% G_ii(i,j) = g(i,i)
G_ii = repmat(diag(g)', length(seeds),1); 


% G_jj(i,j) = g(j,j)
%G_jj = repmat(diag(g), 1, length(seeds)); %equiv to following line cause
%transpose invert column and rows so indexxing is consistent
G_jj = G_ii';  

% biharmonic distance: d(v_i,v_j) = sqrt( g(i,i) + g(j,j) - 2*g(i,j) )
D = sqrt(G_ii + G_jj - 2*g);

toc;
