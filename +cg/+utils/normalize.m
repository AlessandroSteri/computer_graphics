function [f_normalized] = normalize(f)
    m = min(f);
    M = max(f);
    f_normalized = (f - m)/ (M - m);
end

