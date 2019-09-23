function [y] = sum_row(x)
    s = size(x);
    s = s(end);
    ONE = ones(s,1);
    y = x * ONE;
end

