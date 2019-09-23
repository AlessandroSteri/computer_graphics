function [v1,v2,v3, v4]=square(x_0, y_0, side)
    v1 = [x_0 y_0 0];
    v2 = [x_0+side y_0 0];
    v3 = [x_0 y_0+side 0];
    v4 = [x_0+side y_0+side 0];
    
    %check orientation in case switch v1 v2 v3 of t2 o t1
    
    % mano a mano se non ho gia vertice lo salvo e salvo il triangolo con i
    % vertici

end