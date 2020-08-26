%%Quizexam 1. kollonna ir studenta atzime kontroldarba (x)
%2. kollonna ir atzime kesamena (y)
z = quizexam(:,1); % z ir ogrinalais faktors x ir ponetcionala transofrmacija
y = quizexam(:,2);

figure;
plot(z, y, '.', 'MarkerSize', 20);
xlim([5 10]); % dimensijas limits no lidz
ylim([5 10]);

xlabel('Quiz');
ylabel('Exam');
hold on;
grid on; % rada rezgi diagramma

degree = 1;
a = linreg(z, y, degree);


zq = (min(z):0.01:max(z))';
yHat = linreg_predict(zq, a, degree);
plot(zq, yHat, '-');

yHat = linreg_predict(z, a, degree);
[SAE, MAE, SSE, MSE, RMSE, R2] = evaluate_model(y, yHat); 
fprintf('SAE=%.2f, MAE=%.2f, SSE=%.2f, MSE=%.2f, RMSE=%.2f, R2=%.2f\n', ...
    SAE, MAE, SSE, MSE, RMSE, R2);


%{
zq = 6
yHat = linreg_predict(zq, a, degree);
fprintf('Ja kontroldarba atz ir %.1f, tad eks atz ir %.1f\n', zq, yHat);
plot(zq, yHat, '*r');
%}
