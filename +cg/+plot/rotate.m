function rotate(handles, t, n)
    for i = 1:n
        for h = handles
            camorbit(h,360/n,0,'data',[0 1 0]) 
        end;
        drawnow
        pause(t);
    end

end