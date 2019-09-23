cg.init
M = cg.io.load_off('cat0.off');
b = cg.utils.baricenter(M);
%cg.plot.cloud(b);

% Gradient of constant 1
%f = ones(M.n, 1);
%f = rand(M.n,1);
f = M.VERT(:,3);
grad = cg.dg.gradient(M, f);
source = b;
cg.plot.mesh(M);
hold on;

%grad = cg.utils.normr(grad);

out = quiver3(source(:, 1), source(:, 2), source(:, 3), grad(:, 1), grad(:, 2), grad(:, 3), 'MarkerFaceColor', 'r',  'Color', 'r' );