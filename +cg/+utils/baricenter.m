function [b] = baricenter(M)
    b = M.VERT(M.TRIV(:,1),:) + M.VERT(M.TRIV(:,2),:) + M.VERT(M.TRIV(:,3),:)
    b = b ./ 3
end
