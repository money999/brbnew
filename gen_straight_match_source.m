function [adis] = gen_straight_match_source()
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

pp = [0 1 2 3 4 5 6 8];  %8
vv = [0 0.3 0.7 1 1.8 2.4];%6
cc = [0 0.3 0.4 0.5 0.4 0.7 1];%7

adis = zeros(336,3);
ntt = 1;
for i = 1:8
    for j = 1:6
        for k = 1:7
            adis(ntt, :) = [pp(i) vv(j) cc(k)];
            ntt = ntt + 1;
        end
    end
end


end





