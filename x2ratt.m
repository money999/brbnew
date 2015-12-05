function [ ratt ] = x2ratt( x, par )
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

%����X�������������������Ե���ȡrule.B��ʱ��BҲ�����
%���������������ȡB�ĸ���ʱ��size(rule.B,2)��������
%������ȡ�ģ����Գ���

x = x';

rNum = prod(par.preNE);
preN = size(par.preNE, 2);
BNum = par.BNum;
rule(rNum).B = [];
rule(rNum).wR = 0;
for i = 0:rNum-1
    rule(i+1).B = x((i*BNum + 1):(i*BNum + BNum));
    rule(i+1).wR = x(BNum*rNum + 1 + i);
end


ite = BNum * rNum + rNum;
u = par.u;
if (par.uFlag && BNum > 2)%%%u����λҲ������ѵ��
    u(2:BNum-1) = x((ite+1):(ite+BNum - 2));
    ite = rNum * BNum + rNum + BNum - 2;
end


if par.prAwFlag
    ait = ite + preN;
else
    ait = ite;
end

% prA(preN).w = 0;
% prA(preN).a = [];
prA = par.prA;
for i = 1:preN
    
    if par.prAwFlag
        prA(i).w = x(ite + i);
    end
    
    %prA(i).a = par.prA(i).a;%������ûѵ��Ҳ����ԭֵ�Ȱ���β����
    
    
    if par.prAFlag
        tmpa = par.preNE(i) - 2;
        if tmpa > 0
            prA(i).a(2 : (tmpa+1)) = x((ait + 1): (ait + tmpa));
            ait = ait + tmpa;
        end
    end
    
    
end

ratt.rule = rule;
ratt.prA = prA;
ratt.u = u;

end

