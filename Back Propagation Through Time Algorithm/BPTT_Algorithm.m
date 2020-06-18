clc;
clear all;
close all;
% Initial data
u = rand(100,1);
% y = rand(101,1);
y(1) = 0;
y(2) = 0;
yd = y;
for k=2:100
    yd(k+1) = -0.5*yd(k) - yd(k-1) + 0.5*u(k);
end
iterations = 1000;
eta = 0.01;
w1 = 0.01*rand;
w2 = 0.01*rand;
w3 = 0.01*rand;
% BPTT Algorithm
block = 4;
for m = 1:iterations
    for i = 1:block:100-block
        for j = 1:block
            y(i+j+1) = w1*y(i+j)+w2*y(i+j-1)+w
        end
        del = zeros(block+1,1);
        for k = block:- 1:1
            del(k) = del(k+1)*w1+(yd(i+k+1)-y(i+k));
            w1 = w1 + eta*del(k)*y(i+k);
            w2 = w2 + eta*del(k)*y(i+k-1);
            w3 = w3 + eta*del(k)*u(i+k-1);
        end
    end
    w_1(m) = w1;
    w_2(m) = w2;
    w_3(m) = w3;
end
fprintf('Final weights\n')
w1
w2
w3
plot(w_1,'r');
hold on;
plot(w_2,'k');
plot(w_3,'b');
xlabel('Iterations');
ylabel('w_1, w_2 and w_3');
title('Weights Evolutiona ')