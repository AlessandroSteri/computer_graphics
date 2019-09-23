function A = area_elements(M)

A = zeros(size(M.TRIV,1),1);

for k=1:size(M.TRIV,1)
    e31 = M.VERT(M.TRIV(k,3),:) - M.VERT(M.TRIV(k,1),:);
    e21 = M.VERT(M.TRIV(k,2),:) - M.VERT(M.TRIV(k,1),:);

    E = dot(e21,e21);
    F = dot(e21,e31);
    G = dot(e31,e31);

    g = [ E F;
          F G ];
    A(k) = 1/2 * sqrt(det(g));
    % assert( cg.utils.round(A(k),10) == cg.utils.round(0.5*norm(cross(e31,e21)),10) )
end

end
