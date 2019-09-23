function is_equal = equal_abs(A, B)
    is_equal = (abs(A - B) < 1e4*eps(min(abs(A),abs(B))));
end
