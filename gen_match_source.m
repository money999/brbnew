function [ position, velocity, class, posG1, velG1, claG1, posG2, velG2, claG2] = generateSource( nums, square, v_dir, v_nor, spurious)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   num         ���ɶ��ٸ���
%   square      ����ƽ���ڵķ�Χ
%   v_dir       �ٶȵķ���ȡֵ��Χ
%   v_nor       �ٶȵĴ�Сȡֵ��Χ
%   c_num       ������
%   �˴���ʾ��ϸ˵��

num = spurious * nums;%8020����

%����λ�ã���֤û���ظ��ĵ�
position(num, 2) = 0;
position(1,:) = rand(1,2)*square;
for i = 2:num
    while(1)
        tmpp = rand(1,2)*square;
        discov = false;
        for j = 1:i-1
            if position(j,:) == tmpp
                discov = true; break;
            end
        end
        if discov == false
            position(i,:) = tmpp;
            break;
        end
    end
end

%����ٶ��뷽��
dir = rand(num,1)*v_dir;
nor = rand(num,1)*v_nor;
velocity(:,1) = cos(dir).*nor;
velocity(:,2) = sin(dir).*nor;

%���������������+1or-1��Ϊmean��2�Ƿ���
class = normrnd(randi(2,num,1)*2-3, 2);

dim = size(position,1);

%�������ɵ�һ��
posG1 = position + mvnrnd([0,0], 0.04*eye(2), dim);
velG1 = velocity + mvnrnd([0,0], 0.04*eye(2), dim);
claG1 = class + normrnd(0,0.2);

%���ɵڶ���
posG2 = position + mvnrnd([0,0], 0.04*eye(2), dim);
velG2 = velocity + mvnrnd([0,0], 0.04*eye(2), dim);
claG2 = class + normrnd(0,0.2);


if spurious ~= 1
    num = (1 - spurious) * nums;
    num = int32(num);
    
    posG1 = [posG1; rand(num,2)*square];
    posG2 = [posG2; rand(num,2)*square];
    
    dir = rand(num,1)*v_dir;
    nor = rand(num,1)*v_nor;
    tpvel(:,1) = cos(dir).*nor;
    tpvel(:,2) = sin(dir).*nor;
    velG1 = [velG1; tpvel];
    
    dir = rand(num,1)*v_dir;
    nor = rand(num,1)*v_nor;
    tpvel(:,1) = cos(dir).*nor;
    tpvel(:,2) = sin(dir).*nor;
    velG2 = [velG2; tpvel];
    
    claG1 = [claG1; normrnd(randi(2,num,1)*2-3, 2)];
    claG2 = [claG2; normrnd(randi(2,num,1)*2-3, 2)];
    
end
end




