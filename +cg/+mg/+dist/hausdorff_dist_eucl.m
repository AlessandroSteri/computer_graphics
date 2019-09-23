function d_h = hausdorff_dist_eucl(X,Y)
    d = pdist(X,Y);
    ys_to_X = min(d)'; % shape [|Y|,1] : reduce min along dimention |X| to have for each element of Y the set distance to set X
    xs_to_Y = min(d'); % reduce min along dimention |Y| to have for each element of X the set distance to set Y
    
    d_h = max(max(ys_to_X), max(xs_to_Y));

end

