function [h] = Hb()

% Intervall P
p = 0:0.1:1;

h = -p .* log2(p) - (1-p) .* log2(1-p);

plot(p,h);
grid
grid minor
title('Binäre Entropie');
xlabel('Wahrscheinlichkeit');
ylabel('Binäre Entropie');
saveas(gcf, 'huffman.png');

end