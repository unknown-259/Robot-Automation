function dxdt = myODE(t,x,F)
    m = 1;
    a_x = F/m;
    dxdt = [x(2); a_x;];
end
