function [A] = create_flat_triangular_mesh(step, smoothness)
    x = -1:step:1;
    y = x;
    N_p = length(x)*length(y);                  %regular grid
    p = zeros(N_p,3);
    N_t = (length(x)-1)*(length(y)-1)*2;        %two triangles per square
    tri = zeros(N_t,3);
    n_p = 1;
    n_t = 1;
    for i=1:length(x);
        for j=1:length(y);
            p(n_p,:) = [x(i) y(j) 0];

            if i<length(x) & j<length(y)
                tri(n_t,:) = [n_p, n_p + 1, n_p + length(y)];
                n_t = n_t + 1;
                tri(n_t,:) = [n_p + 1, n_p + length(y), n_p + length(y) + 1];
                n_t = n_t + 1;
            end;

            n_p = n_p+1;        
        end;
    end;
    if nargin < 2
        smoothness = 0;
    end;
    p(:,end) = smoothness*(0.5 - rand(size(p,1), 1));
    A.TRIV = tri;
    A.VERT = p;
    A.n = size(A.VERT,1);
    A.m = size(A.TRIV,1);
end