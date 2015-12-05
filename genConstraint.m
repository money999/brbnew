function [ A, b, Aeq, beq, lb, ub ] = genConstraint( ratt, x, par )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
prA = ratt.prA;
rule = ratt.rule;
preN = size(prA, 2);
preNE = par.preNE;

xNum = size(x, 2);
rNum = size(rule, 2);
BNum = par.BNum;

Aeq = zeros(rNum, xNum);
beq = ones(rNum, 1);
%%%%%���Ŷ�Ϊ1�ĵ�ʽԼ��%%%%%
%%%��ȡ��
for i = 0:rNum-1
    Aeq(i+1, BNum * i + 1 : BNum * i + BNum) = ones(1, BNum);
end
% for i = 0:rNum-1
%     Aeq(i+1,  1:BNum) = ones(1, BNum);
% end

%%%%%����ʽԼ��%%%%%
ite = rNum * BNum + rNum;%ȥ��B��wR
%%%1������ֵԼ��
uA = [];
ub = [];
if (par.uFlag && BNum > 3)
    tBNum = BNum - 3;
    uA = zeros(tBNum, xNum); %uA(tBNum, xNum) = 0;%%���û��Ԥ�ȷ��䣿
    for i = 1:tBNum
        uA(i, ite + i:ite + i + 1) = [1 -1];
    end
    ite = ite + BNum - 2;
    ub = zeros(tBNum, 1); %uA * X < ub
end
%%%2����ѡֵԼ��
if par.prAwFlag %%��ѵ��w�Ͳ�������
    ite = ite + preN; %%�����м��prA.w
end

pA = [];
pb = [];
%  tt = preNE - 3;
%  tt(tt<0) = 0;
%  pb = zeros(sum(tt),1);
if par.prAFlag
    for i = 1:preN
        if preNE(i) > 3
            nowNE = preNE(i) - 3;
            for j = 1:nowNE
                tmpS = zeros(1, xNum);
                tmpS(ite + j : ite + j + 1) = [1 -1];
                pA = [pA; tmpS];
                pb = [pb; 0];
            end
            ite = ite + nowNE + 1;
        end
    end
end

A = [uA; pA];
b = [ub; pb];

%%%�����СֵԼ��
%�ı� u �� ǰ���ѡֵ��βֵ

lb = zeros(1, xNum);
ub = ones(1, xNum);

ite = rNum * BNum + rNum;
if (par.uFlag && BNum > 2)
    lb(ite + 1 : ite + BNum - 2) = ratt.u(1);
    ub(ite + 1 : ite + BNum - 2) = ratt.u(BNum);
    ite = ite + BNum - 2;
end

if par.prAFlag
    if par.prAwFlag
        ite = ite + preN;
    end
    for i = 1:preN
        tt = preNE(i);
        if tt > 2
            lb(ite + 1 : ite + tt - 2) = prA(i).a(1);
            ub(ite + 1 : ite + tt - 2) = prA(i).a(tt);
        end
        ite = ite + tt - 2;
    end
end
%�ٸı�ÿ������Ȩ�ش���0��û�еȣ�
wAS = rNum * BNum + 1;%Ȩ����x0�е����
wAE = rNum * BNum + rNum;%Ȩ����x0�е��յ�
lb(wAS:wAE) = 1e-8;

end

