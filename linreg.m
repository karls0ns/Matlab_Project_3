function a= linreg (z, y, degree)
    m = size(z,2);
    if (degree <= 1) || (m <= 1)
       x = ones(size(z,1),1);
       for i = 1 : degree
           x = [x z.^i]; %pievieno z vektoru i-taja pakape
       end
       a = x \ y;
    else
        error('linreg: Nav realizets.');
    end
end