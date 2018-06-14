clear vars;
close all
clc

% MODIFY THIS
deg = 30;

% CODE BELOW THIS LINE

fprintf('\n');
disp("We will now attempt to demonstrate H^{inv}H x^"+deg+" = x^"+deg);
fprintf('\n');

if mod(deg,2) == 0
    pol = 1; % 1 for even
else if mod(deg,2) == 1
        pol = -1; % -1 for odd
    else if deg < 0
            error('Negative polynomial degree!');
        else
            error('Non-integral polynomial degree!');
        end
    end
end

% Calculate coefficients of H x^(deg)

if pol == 1
    H = coeffNe(deg);
else
    H = coeffNo(deg);
end

% Display cofficients of H x^(deg)

fprintf('\n');
disp(["Operating H on x^"+deg]);
fprintf('\n');
str_H = "Hx^" + deg +" = ";
for j = 1:numel(H)
    str_H = str_H + H(j) + "x^" + (deg-(j-1));
    if j ~= numel(H)
        str_H = str_H + " + ";
    end
end

disp(str_H);

Hinv = zeros(deg+1,deg+1);

fprintf('\n');
disp(["Operating H^{i} on x^i for i from 0 to "+deg]);
fprintf('\n');
for j = deg:-1:0
    if mod(j,2) == 0
        poli = 1;
    else
        poli = 0;
    end
    if poli == 1
        Hi = -abs(coeffNe(j));
    else
        Hi = -abs(coeffNo(j));
    end
    str_Hi = "H^{-1} x^" + j +" = ";
    for k = 1:numel(Hi)
        str_Hi = str_Hi + Hi(k) + "x^" + (j-(k-1));
        if k ~= numel(Hi)
            str_Hi = str_Hi + " + ";
        end
    end
    disp(str_Hi);
    Hinv(deg -j+1,:) = [zeros(1,deg-j),Hi];
end

fprintf('\n');
disp("Now we ultimately verify that H^{inv}H x^"+deg+" = x^"+deg);
fprintf('\n');

HinvH = (H*Hinv)';
str_HinvH = "H^{-1}H x^" + deg +" = ";
for j = 1:numel(HinvH)
    str_HinvH = str_HinvH + HinvH(j) + "x^" + (deg-(j-1));
    if j ~= numel(HinvH)
        str_HinvH = str_HinvH + " + ";
    end
end

disp(str_HinvH);

H = H';
Hinv = Hinv';