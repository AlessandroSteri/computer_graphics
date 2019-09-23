function [S_v, S_i] = fps(M, n, seed)
    S_v = zeros(n,3);
    S_i = zeros(n,1);
    S_v(1,:) = M(seed,:);
    S_i(1) = seed;
    %S_v = [[];M(seed,:)];
    %S_i = [[];seed];

    for i = 2:n
        d = pdist2(M, S_v); % shape [|M|,|S|] distances from all element of M to all element of S
        d_S = min(d'); % reduce min along dimention |S| to have for each element of x the set distance to set S
        [argvalue, argmax] = max(d_S); % reduce max to have the farthest x to set S
        v = M(argmax,:); % =take the vector
        S_v(i,:) = v;
        S_i(i) = argmax;
        % avoid duplicates
        %S_v = unique([S_v;v], 'rows');
        %S_i = unique([S_i;argmax], 'rows'); 
    end
end

