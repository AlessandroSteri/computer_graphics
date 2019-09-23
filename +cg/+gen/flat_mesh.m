function M = flat_mesh(l1,l2,hole)
    M.VERT = [l2 l2 0];
    M.TRIV = [1 2 3];
    for i=l2:l1
        for j=l2:l1
            if abs(i)>hole | abs(j)> hole
                [v1,v2,v3,v4]=cg.gen.square(i, j, 1);

                %v1
                [~,v1_i] = ismember(M.VERT,v1,'rows');
                if ~v1_i
                    M.VERT(end+1,:) = v1;
                    v1_i = size(M.VERT,1);
                else
                    v1_i = find(v1_i,1);
                end;
                %v2
                [~,v2_i] = ismember(M.VERT,v2,'rows');
                if ~v2_i
                    M.VERT(end+1,:) = v2;
                    v2_i = size(M.VERT,1);
                else
                    v2_i = find(v2_i,1);
                end;
                %v3
                [~,v3_i] = ismember(M.VERT,v3,'rows');
                if ~v3_i
                    M.VERT(end+1,:) = v3;
                    v3_i = size(M.VERT,1); 
                else
                    v3_i = find(v3_i,1);
                end;
                %v4
                [~,v4_i] = ismember(M.VERT,v4,'rows');
                if ~v4_i
                    M.VERT(end+1,:) = v4;
                    v4_i = size(M.VERT,1); 
                else
                    v4_i = find(v4_i,1);
                end;

                %T1
                M.TRIV(end+1,:) = [v1_i v2_i v3_i];
                % M.TRIV(end+1,:) = [v1_i v2_i v4_i];
                %T2
                M.TRIV(end+1,:) = [v2_i v4_i v3_i];
                % M.TRIV(end+1,:) = [v1_i v3_i v4_i];
            end;
        end;
    end;
    M.n = size(M.VERT,1);
    M.m = size(M.TRIV,1);
end
