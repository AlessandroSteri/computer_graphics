function [y] = sum_col(x)
    s = size(x);
    s = s(1);
    ONE = ones(s,1);
    y = x' * ONE;
end

