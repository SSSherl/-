N = 100;
D = 10;
T = 200;
c1 = 1.5;
c2 = 1.5;
w = 0.8;
Xm = 20;
Vm = 10;

x = rand(N, D) * 2 * Xm - Xm;
v = rand(N, D) * 2 * Vm - Vm;
pbest = ones(N, 1);
p = x;
gbest = inf;
g = ones(1, D);
gb = ones(T,1);
%计算适应度
for i = 1:N
    pbest(i) = func(x(i,:));
end
%计算此时的全局最优
for i = 1:N
    if pbest(i) < gbest
        gbest = pbest(i);
        g = p(1,:);
    end
end

for j = 1:T
    for i = 1:N
         if func(x(i,:)) < pbest(i)
            pbest(i) = func(x(i,:));
            p(i,:) = x(i,:);
        end
        if pbest(i) < gbest
            gbest = pbest(i);
            g = p(i,:);
        end
        v(i,:) = w * v(i,:) + c1 * rand * (p(i,:) - x(i,:))...
                + c2 * rand * (g - x(i,:));
        x(i,:) = x(i,:) + v(i,:);
        for ii = 1:D
            if abs(x(i,ii)) > Xm
                x(i,ii) = Xm;
            end
            if abs(v(i,ii)) > Vm
                v(i,ii) = Vm;
            end
        end
    end
    gb(j) = gbest;
end
plot(gb)
Xlabel('迭代次数');
Ylabel('适应度');
title('适应度曲线')


