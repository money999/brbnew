function [ x ] = ratt2x( ratt, par)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%   x���η�ÿ�������B��wR�� �ٷ�����ֵ��ǰ������Ȩ�أ� ǰ������Ȩ�غ�ѡֵ


prA = ratt.prA;
rule = ratt.rule;
preN = size(prA, 2);
BNum = par.BNum;

if (par.uFlag && BNum > 2)%%%u����λҲ������ѵ��
    x = [[rule.B] [rule.wR] ratt.u(2:BNum-1)];
else
    x = [[rule.B] [rule.wR]];
end

if par.prAwFlag
    x = [x [prA.w]];
end

if par.prAFlag
    tmpx = [];
    for i = 1:preN
        iprAN = size(prA(i).a, 2);
        if iprAN > 2
             tmpx = [tmpx prA(i).a(2:iprAN-1)];
        end
    end
    x = [x tmpx];
end
end

