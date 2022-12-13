N = 3;
D = 2;
w = 0.8;
c1 = 2;
c2 = 2;
Xm = 10;
Vm = 5;
T = 50;
x = rand(N, D) * 2 * Xm - Xm;
v = rand(N, D) * 2 * Vm - Vm;
p = x;
pbest = ones(N, 1);
gbest = inf;
g = ones(1,D);
gb = ones(T, 1);
for i = 1:N
    pbest(i) = func1(x(i,:));
end
for i = 1:N
    if pbest(i) < gbest
       gbest = pbest(i);
       g = p(i,:);
    end
end
for j = 1:T
    for i = 1:N
        if func1(x(i,:)) < pbest(i)
            pbest(i) = func1(x(i,:));
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
Xlabel('迭代次数')
Ylabel('适应度')
title('适应度曲线')

