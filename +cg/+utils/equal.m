function is_equal = equal(A, B)
    warning("[cg.equal] is sign insentitive, check why")
    is_equal = cg.utils.round(A, 9) == cg.utils.round(B, 9);
end
