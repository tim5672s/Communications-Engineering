function[] = myComprExpand()
    %sinus
    pi = 3.141;
    k = 1;
    t = (0 : 0.01 : k*2*pi);
    x = sin(t);

    %Mu für Kompr und Expand
    Mu = 255;
    
    %Kompressorkennlinie
    figure(1)
    compr = (log(1+Mu*abs(x)))./(log(1+Mu)).*sign(x);
    plot(x, compr);
    grid
    grid minor
    title('Compressorkennlinie');
    xlabel('Eingangsamplitude');
    ylabel('Ausgangsamplitude');
    saveas(gcf, 'compressorkennlinie.png');
    
    %Expanderkennlinie
    figure(2)
    expand = ((Mu+1).^(abs(x))-1)/(Mu) .* sign(x);
    plot(x, expand);
    grid
    grid minor
    title('Expanderkennlinie');
    xlabel('Eingangsamplitude');
    ylabel('Ausgangsamplitude');
    saveas(gcf, 'expanderkennlinie.png');



end