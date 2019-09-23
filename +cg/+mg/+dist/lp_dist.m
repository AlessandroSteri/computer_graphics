function [d] = lp_dist(v1, v2, p)
    if ~exist('p','var')
      p = 2;
    end
    
    d = ( sum( abs(v1-v2) .^ p ) ) ^ (1/p);
 
end
