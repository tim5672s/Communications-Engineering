function[] = myQuantisierung()
    pi = 3.141;
    k = 1;
    t = (0 : 0.01 : k*2*pi);
    y = 2*sin(t);
    
    [sqnr8, a_quan8, code8] = u_pcm(y,8);
    [sqnr16, a_quan16, code16] = u_pcm(y,16);
    
    
    figure(1)
    plot(t,y);
    hold
    plot(t, a_quan8, 'r', t, a_quan16, 'g')
    grid
    grid minor
    title('Quantisierung Sinussignal mit 8 und 16 Stufen');
    xlabel('t');
    ylabel('Amplitude');
    legend('Sinussignal', 'Quantisierung8', 'Quantisierung16');
    saveas(gcf, 'Quantisierungskennlinief8u16Stufen.png');
    
    figure(2)
    sort(y);
    plot(y, a_quan8);
    title('Quantisierungskennlinie f. 8-Stufen');
    xlabel('Amplitude des Sinussignals');
    ylabel('Ausgang des Quantisierers');
    saveas(gcf, 'Quantisierungskennlinief8Stufen.png');
    
    
    figure(3)
    q = y - a_quan8;
    histogram(q, 9);
    title('Verteilung des Quantisierungsfehlers');
    xlabel('Quantisierungsfehler');
    ylabel('Häufigkeit');    
    saveas(gcf, 'VerteilungQuantisierungsfehler.png');
    
    

end

