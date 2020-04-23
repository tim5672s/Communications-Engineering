function[H] = myEntropie(v)

    sort_v = sort(v);
    if (sum(v)==1 && sort_v(1,1) >= 0)
        %msgbox('Zeilenvektor v ist Wahrscheinlichkeitsvektor');
        H = -sum(v .* log2(v)); 
    else
        msgbox('Zeilenvektor v ist kein Wahrscheinlichkeitsvektor');

    %p_1 = [0.2 0.15 0.13 0.12 0.1 0.09 0.08 0.07 0.06];
    %p_2 = [0.1 0.3 0.05 0.09 0.21 0.25];
    %p_3 = [1/2 1/4 1/8 1/16 1/32 1/64 1/128 1/256 1/256];
end