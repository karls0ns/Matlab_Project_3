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

x = [ones(size(z,1),1) z];
a = x \ y; % linearas regresijas parametru A atrasana

zq = (min(z):0.01:max(z))';
x = [ones(size(zq,1),1) zq];

%garais veids
%{
yHat = zeros(size(x,1),1); %nodefine matricas izmeru
for i = 1 : size(x,1)
    yHat(i) = a(1) * x(i,1) + a(2) * x(i,2);
end
%}
%isais veids
yHat = x * a;
plot(zq, yHat, '-');

zq = 6;
yHat = [1 zq] * a;
fprintf('Ja kontroldarba atz ir %.1f, tad eks atz ir %.1f\n', zq, yHat);
plot(zq, yHat, '*r');