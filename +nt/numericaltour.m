getd = @(p)path(p,path);

getd('toolbox_signal/');
getd('toolbox_general/');
getd('toolbox_graph/');

%% Gradient, Divergence and Laplacian on Surfaces

clear options;
name = 'elephant-50kv';
options.name = name; % useful for displaying
[X,F] = read_mesh(name);

n = size(X,2); % vertex
m = size(F,2); % faces

% Display the mesh in 3-D.
options.lighting = 1;
clf;
plot_mesh(X,F,options);
axis('tight');

XF = @(i)X(:,F(i,:));

Na = cross( XF(2)-XF(1), XF(3)-XF(1) );


% Compute the area of each face as half the norm of the cross product.
amplitude = @(X)sqrt( sum( X.^2 ) );
A = amplitude(Na)/2;

% Compute the set of unit-norm normals to each face.

normalize = @(X)X ./ repmat(amplitude(X), [3 1]);
N = normalize(Na);

I = []; J = []; V = []; % indexes to build the sparse matrices
for i=1:3
    % opposite edge e_i indexes
    s = mod(i,3)+1;
    t = mod(i+1,3)+1;
    % vector N_f^e_i
    wi = cross(XF(t)-XF(s),N);
    % update the index listing
    I = [I, 1:m];
    J = [J, F(i,:)];
    V = [V, wi];
end

dA = spdiags(1./(2*A(:)),0,m,m);

GradMat = {};
for k=1:3
    GradMat{k} = dA*sparse(I,J,V(k,:),m,n);
end

% gradient operator.
Grad = @(u)[GradMat{1}*u, GradMat{2}*u, GradMat{3}*u]';

% Compute divergence matrices as transposed of grad for the face area inner product.
dAf = spdiags(2*A(:),0,m,m);
DivMat = {GradMat{1}'*dAf, GradMat{2}'*dAf, GradMat{3}'*dAf};

% Div operator.
Div = @(q)DivMat{1}*q(1,:)' + DivMat{2}*q(2,:)' + DivMat{3}*q(3,:)';

% Laplacian operator as the composition of grad and div.
Delta = DivMat{1}*GradMat{1} + DivMat{2}*GradMat{2} + DivMat{3}*GradMat{3};

% Cotan of an angle between two vectors.

cota = @(a,b)cot( acos( dot(normalize(a),normalize(b)) ) );

% Compute cotan weights Laplacian.
I = []; J = []; V = []; % indexes to build the sparse matrices
Ia = []; Va = []; % area of vertices
for i=1:3
    % opposite edge e_i indexes
    s = mod(i,3)+1;
    t = mod(i+1,3)+1;
    % adjacent edge
    ctheta = cota(XF(s)-XF(i), XF(t)-XF(i));
    % ctheta = max(ctheta, 1e-2); % avoid degeneracy
    % update the index listing
    I = [I, F(s,:), F(t,:)];
    J = [J, F(t,:), F(s,:)];
    V = [V, ctheta, ctheta];
    % update the diagonal with area of face around vertices
    Ia = [Ia, F(i,:)];
    Va = [Va, A];
end
% Aread diagonal matrix
Ac = sparse(Ia,Ia,Va,n,n);
% Cotan weights
Wc = sparse(I,J,V,n,n);
% Laplacian with cotan weights.
DeltaCot = spdiags(full(sum(Wc))', 0, n,n) - Wc;


%Check that the Laplacian with cotan weights is actually equal to the composition of divergence and gradient.
fprintf('Should be 0: %e\n', norm(Delta-DeltaCot, 'fro')/norm(Delta, 'fro'));

%Display a function f on the mesh.

f = X(2,:);
options.face_vertex_color = f(:);
clf; plot_mesh(X,F,options);
axis('tight');
colormap parula(256);


% Display its Laplacian.
g = Delta*f(:);
g = clamp(g, -3*std(g), 3*std(g));
options.face_vertex_color = rescale(g);
clf; plot_mesh(X,F,options);
axis('tight');
colormap parula(256);

%% Heat Diffusion and Time Stepping

% Dirac vector at vertex index i
i = 21000; % vertex index
t = 1000; % time

%Solve the linear system.
delta = zeros(n,1);
delta(i) = 1;
u = (Ac+t*Delta)\delta;

% Display this solution.
options.face_vertex_color = u;
clf; plot_mesh(X,F,options);
axis('tight');
colormap parula(256);

%% Geodesic in Heat Method

% compute solution: u 
t = .1;
u = (Ac+t*DeltaCot)\delta;


%comopute gradient and normalize
g = Grad(u);
h = -normalize(g);

%Integrate it back by solving Δφ=div(h).
phi = Delta \ Div(h);

% display
options.face_vertex_color = phi;
clf; plot_mesh(X,F,options);
axis('tight');
colormap parula(256);

%% Functions for displaying the level sets of the distance.

p = 30;
DispFunc = @(phi)cos(2*pi*p*phi);

% Same, but using a different colormap.

options.face_vertex_color = DispFunc(phi);
clf; plot_mesh(X,F,options);
axis('tight');
colormap parula(256);