% lh=findall(gca,'type','line');
% xc = get(lh, 'xdata');
% yc = get(lh, 'ydata');
% plot(xc,yc)


% ang = 0:0.01:2*pi;
% r = zeros(size(ang));
% N = length(ang);
% r(1) = 1;
% syms x y
% f = (x^2-1)^3/(x^5) - sin(y)^3 * cos(y)^2;
% 
% for i = 2 : N
%     f1 = subs(f, y, ang(i));
%     rlt = solve(f1);
%     rlt = eval(rlt);
% 
%     [~, ind] = min(abs(rlt-r(i-1)));
%     r(i) = rlt(ind);
% end
% 
% x = r .* cos(ang);
% y = r .* sin(ang);
% plot(x,y);

ezplot('')