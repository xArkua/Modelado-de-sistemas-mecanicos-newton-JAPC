m1 = 290;
m2 = 59;
k1 = 16182;
k2 = 19000;
b1 = 1000;
f = 0;

function dy = suspension_model(t, y, m1, m2, k1, k2, b1, f, z_t)
    dy = zeros(4,1);
    
    dy(1) = y(2);
    dy(2) = (1/m1) * (f - (b1 * y(2)) + (b1 * y(4)) - (k1 * y(1)) + (k1 * y(3)));
    dy(3) = y(4);
    dy(4) = (1/m2) * (-f + (z_t(t) * k2) + (b1 * y(2)) - (b1 * y(4)) + (k1 * y(1)) - ((k1 + k2) * y(3)));
end

z1 = @(t) 0.05*sin(0.5*pi*t);
[t, X] = ode45(@(t, y) suspension_model(t, y, m1, m2, k1, k2, b1, f, z1), [0 5], [0; 0; 0; 0]);

figure;
subplot(2,1,1);
plot(t, X(:,1));
title('Desplazamiento m1 con z1(t)');
xlabel('Tiempo (s)');
ylabel('x_1(t)');

subplot(2,1,2);
plot(t, X(:,2));
title('Desplazamiento m2 con z1(t)');
xlabel('Tiempo (s)');
ylabel('x_2(t)');

z2 = @(t) 0.05*sin(20*pi*t);
[t, X] = ode45(@(t, y) suspension_model(t, y, m1, m2, k1, k2, b1, f, z2), [0 5], [0; 0; 0; 0]);

figure;
subplot(2,1,1);
plot(t, X(:,1));
title('Desplazamiento m1 con z2(t)');
xlabel('Tiempo (s)');
ylabel('x_1(t)');

subplot(2,1,2);
plot(t, X(:,2));
title('Desplazamiento m2 con z2(t)');
xlabel('Tiempo (s)');
ylabel('x_2(t)');