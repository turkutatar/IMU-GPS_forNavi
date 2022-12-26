clc
close all
opts.x_fig = 200; opts.y_fig = 50; opts.x_w = 1000;

%% GCS
figure(10)
set(gcf, 'Position', [opts.x_fig opts.y_fig opts.x_w opts.x_w*0.6])
grid on; hold on
stairs(x(:,1), x(:,2), 'Color', 'r', 'LineWidth', 2);
stairs(x(:,1), x(:,3), 'Color', 'g', 'LineWidth', 2);
stairs(x(:,1), x(:,4), 'Color', 'b', 'LineWidth', 2);
stairs(x(:,1), x(:,5), 'Color', 'g', 'LineWidth', 2);
set(gca, 'FontName', 'Times New Roman', 'FontAngle', 'italic', 'FontSize', 24)
xlabel('t (s)'); ylabel('States');
hh = legend('$x$','$\Theta$','$xdot$','$Thetadot$');
set(hh, 'FontName', 'Times New Roman',   'FontSize', 24, 'Interpreter', 'latex')
clear hh
figure(11)
set(gcf, 'Position', [opts.x_fig opts.y_fig opts.x_w opts.x_w*0.6])
grid on; hold on
stairs(x_est(:,1), x_est(:,2), 'Color', 'r', 'LineWidth', 2);
stairs(x_est(:,1), x_est(:,3), 'Color', 'g', 'LineWidth', 2);
stairs(x_est(:,1), x_est(:,4), 'Color', 'b', 'LineWidth', 2);
stairs(x_est(:,1), x_est(:,5), 'Color', 'g', 'LineWidth', 2);
set(gca, 'FontName', 'Times New Roman', 'FontAngle', 'italic', 'FontSize', 24)
xlabel('t (s)'); ylabel('Observing States');
hh = legend('$x$','$\Theta$','$xdot$','$Thetadot$');
set(hh, 'FontName', 'Times New Roman',   'FontSize', 24, 'Interpreter', 'latex')
clear hh
figure(12)
set(gcf, 'Position', [opts.x_fig opts.y_fig opts.x_w opts.x_w*0.6])
grid on; hold on
stairs(x(:,1), x(:,2), 'Color', 'r', 'LineWidth', 2);
stairs(x(:,1), x(:,3), 'Color', 'g', 'LineWidth', 2);
stairs(x(:,1), x(:,4), 'Color', 'b', 'LineWidth', 2);
stairs(x(:,1), x(:,5), 'Color', 'g', 'LineWidth', 2);
stairs(x_est(:,1), x_est(:,2), 'Color', 'k', 'LineWidth', 2);
stairs(x_est(:,1), x_est(:,3), 'Color', 'm', 'LineWidth', 2);
stairs(x_est(:,1), x_est(:,4), 'Color', 'c', 'LineWidth', 2);
stairs(x_est(:,1), x_est(:,5), 'Color', 'y', 'LineWidth', 2);
xlabel('t (s)'); ylabel('Observing States and States');
hh = legend('$x$','$\Theta$','$xdot$','$Thetadot$','Obs_x','Obs_theta','Obs_xdot','Obs_thetadot');
figure(13)
set(gcf, 'Position', [opts.x_fig opts.y_fig opts.x_w opts.x_w*0.6])
grid on; hold on
stairs(error(:,1), error(:,2), 'Color', 'r', 'LineWidth', 2);
stairs(error(:,1), error(:,3), 'Color', 'm', 'LineWidth', 2);
stairs(error(:,1), error(:,4), 'Color', 'b', 'LineWidth', 2);
stairs(error(:,1), error(:,5), 'Color', 'g', 'LineWidth', 2);
xlabel('t (s)'); ylabel('Error');
hh = legend('x','theta','xdot','thetadot');