#Implementing filters and studying coefficient a :

#Simple digital filter : y[n] = (1-a)x[n] + ay[n - 1]

x = [zeros(10, 1); ones(40, 1)]; #Signal with 10 zeroes then 40 one

a = 0.9;

b_coeffs = [1 - a];
a_coeffs = [1, -a];

y = filter(b_coeffs, a_coeffs, x);

#plotting i/p and o/p
plot(x, 'b', 'LineWidth', 2);
hold on;
plot(y, 'r--', 'LineWidth', 2);
hold off;
legend('Input Signal (x)', 'Filtered Signal (y)');
title(['Filter Performance with a = ', num2str(a)]);
