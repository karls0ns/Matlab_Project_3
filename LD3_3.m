% 2. uzdevums
% Cikl? vajag apr??in?t parametrus polinomiem ar pak?pi no 0 l?dz 9
%un izvad?t katra polinoma k??du krit?rijus

%taj? paš? cikl? saglab?t katra polinoma MSE v?t?bu kop?j? vektor? MSEall
%ar indeksu degree+1 un beig?s p?c cikla par?d?t MSEall v?rt?bas diagramm?
%k? grafiks, kur X ass ir polinoma pak?pe no (0 l?dz9) un Y ass ir MSE
%v?rt?ba pie attiec?g?s pak?pes
clc
MSEall = zeros(10,1);
z = quizexam(:,1); 
y = quizexam(:,2);
for degree = 0 : 9 
a = linreg(z, y, degree);
yHat = linreg_predict(z, a, degree);
[SAE, MAE, SSE, MSE, RMSE, R2] = evaluate_model(y, yHat);
fprintf('Pakape=%d''SAE=%.2f, MAE=%.2f, SSE=%.2f, MSE=%.2f, RMSE=%.2f, R2=%.2f\n', ...
    degree, SAE, MAE, SSE, MSE, RMSE, R2);

MSEall(degree+1) = MSE;
end

figure;
plot(0:9, MSEall, '-');

xlabel('Polinoma pakape');
ylabel('MSE vertiba');
grid on;
