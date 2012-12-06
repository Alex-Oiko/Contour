points = load('./report/M-time');
plot(log(points(:, 1)), log(points(:, 2)), 'r-','LineWidth',1);
title('M-Time Plot(Graph 1)');
xlabel('log(M)');
ylabel('log(Time)');
