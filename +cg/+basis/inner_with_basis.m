function res = inner_with_basis(v, u, W)
% u, v row vectors, W the sasis in wich u and v are expressed
    res = u * W' * W * v';
end