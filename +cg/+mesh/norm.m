function [N] = norm(M)
    %  vertex to coord
    VT = @(i) M.VERT(M.TRIV(:,i),:);
    % coord to oriented edge
    e_ij = @(i,j) VT(j)-VT(i);
    N = cross(e_ij(1,2), e_ij(1,3));
end