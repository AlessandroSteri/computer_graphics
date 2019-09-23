function X_round = round(X, n_digits)
    e = 10^n_digits;
    X_round = round(X*e)/e;
end
