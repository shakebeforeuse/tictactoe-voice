function [ segmentos, inicio, fin ] = inicio_fin(segmentos, num_segmentos_ruido)
    global VENTANA

    
    % Calculamos magnitud y tasa de cruces por cero
    magni = magnitud(segmentos, VENTANA);
    tcc   = cruces_por_cero(segmentos, VENTANA);
    
    % Consideramos ruido los 10 primeros segmentos
    Ms = magni(1:num_segmentos_ruido);
    Zs = tcc(1:num_segmentos_ruido);

    % Calculamos los umbrales
    UmbSupEnrg = .5 * max(magni);
    UmbInfEnrg = mean(Ms) + 2 * std(Ms);
    UmbCruCero = mean(Zs) + 2 * std(Zs);

    % Calculamos dónde está el primer sonido sonoro, lo cual nos garantiza que
    % ahí existe señal (y no ruido).
    n = num_segmentos_ruido + 1;
    while (n <= length(magni) && magni(n) <= UmbSupEnrg)
        n = n + 1; 
    end
    In = n - 1;

    % Puede que el sonido haya comenzado antes de _In_, pero con menos
    % intensidad. Recorremos hacia atrás hasta asegurarnos que lo que queda es
    % ruido o algún sonido no sonoro.
    n = In;
    while (n > 0 && magni(n) >= UmbInfEnrg)
        n = n - 1;
    end
    Ie = n + 1;

    % Averiguamos si al sonido sonoro encontrado le precede uno no sonoro.
    n = min([Ie length(tcc)]);
    cont = 0;
    Iz = inf;

    % Si se sobrepasa el umbral de cruces por cero tres o más veces seguidas,
    % _Iz_ será el nuevo comienzo. En otro caso, mantenemos el inicio de la
    % palabra en _Ie_.
    while (n >= max([1 Ie-25]) && Iz == inf)
        if (tcc(n) > UmbCruCero)
            cont = cont + 1;
        else
            if (cont >= 3)
                Iz = n + 1;
            end

            cont = 0;
        end
        n = n - 1;
    end

    inicio = min([Iz Ie]);

    % Averiguamos ahora el final de la palabra. Empezamos buscando el último
    % sonido sonoro.

    n = length(magni);
    while (n >= In && magni(n) <= UmbInfEnrg)
        n = n - 1; 
    end
    Fn = n + 1;
    

    % Es posible que la palabra acabe con menos intensidad. Buscamos el punto
    % en el cual dejamos de tener un sonido sonoro.
    n = Fn;
    while (n <= length(magni) && magni(n) >= UmbInfEnrg)
        n = n + 1;
    end
    Fe = n - 1;

    % Puede que la palabra acabe en algún sonido sordo. Recorremos los
    % segmentos buscándolos, de forma análoga a como lo hicimos en el inicio
    % (si hay tres o más segmentos seguidos que sobrepasen el número umbral de
    % cruces por cero, asumimos un nuevo fin).
    n = Fe;
    cont = 0;
    Fz = -inf;

    while (n <= min([length(tcc) Fe+25]) && Fz == -inf)
        if (tcc(n) > UmbCruCero)
            cont = cont + 1;
        else
            if (cont >= 3)
                Fz = n - 1;
            end

            cont = 0;
        end
        n = n + 1;
    end

    fin = max([Fz Fe]);
    
    segmentos = segmentos(:, inicio:fin);
end

