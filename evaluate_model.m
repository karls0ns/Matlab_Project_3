function [SAE, MAE, SSE, MSE, RMSE, R2] = evaluate_model(y, yHat)
    n = size(y,1);
    SAE = sum(abs(y - yHat));
    MAE = SAE / n;
    SSE = sum((y - yHat).^2);
    MSE = SSE / n;
    RMSE = sqrt(MSE);
    R2 = 1 - SSE / (sum((y - mean(y)).^2)); 
end