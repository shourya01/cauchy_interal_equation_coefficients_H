function F = coeffNo(n)

if mod(n,2) ~= 1
    error('Bad n value!');
end

F = [];
f = @(x,y) (1/sqrt(pi))*gamma(0.5*(x-y))/gamma(0.5*(x-y+1));

for k = 0:n
    if mod(k,2) == 0
        r1 = k;
    else
        r1 = k-1;
    end
    C = ((-1)^(k))*f(n,r1);
%     disp("Current coeff add, n="+n+" k="+k+" coeff="+C);
    F = [F C];
end

F = F(end:-1:1);

end