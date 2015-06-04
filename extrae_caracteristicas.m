function [ caracteristicas ] = extrae_caracteristicas( sonido )
    global FRECUENCIA_DE_MUESTREO
    global PREENFASIS_a
    global EXTRAE_CARACTERISTICAS_tiempo_ventana
    global EXTRAE_CARACTERISTICAS_P
    global VENTANA
    global DETECTA_PALABRA_segmentos_ruido

    %%
    %  Aplicamos el filtro preénfasis.
    PREENFASIS_a = 0.9;
    y = preenfasis(sonido, PREENFASIS_a);

    %%
    %  Segmentamos la señal.
    tam_segmento   = EXTRAE_CARACTERISTICAS_tiempo_ventana * FRECUENCIA_DE_MUESTREO;
    despl          = round(0.5 * tam_segmento);

    segmentos = segmentacion(y, tam_segmento, despl);

    %%
    %  Aplicamos una adaptación del algoritmo de Rabiner-Sambur para detectar
    %  el inicio y el fin de una palabra.
    DETECTA_PALABRA_segmentos_ruido = 10;
    segmentosPalabra = inicio_fin(segmentos, DETECTA_PALABRA_segmentos_ruido);

    %%
    % Enventanamos los segmentos usando una ventana _hamming_
    segmentosPalabraEnventanados = enventado(segmentosPalabra, VENTANA);


    %%
    % Calculamos los coeficientes Cepstrum y tomamos los trece primeros.
    % Después descartamos el primero.
    rcepstrum = rceps(segmentosPalabraEnventanados);
    rcepstrum = rcepstrum(2:13, :);


    %%
    % Calculamos los coeficientes delta
    EXTRAE_CARACTERISTICAS_P = 4;

    p = -EXTRAE_CARACTERISTICAS_P:EXTRAE_CARACTERISTICAS_P;
    p = repmat(p, size(rcepstrum, 1), 1);

    zrcepstrum = [zeros(size(rcepstrum, 1), EXTRAE_CARACTERISTICAS_P) rcepstrum zeros(size(rcepstrum, 1), EXTRAE_CARACTERISTICAS_P)];

    valores_p = [zeros(1, EXTRAE_CARACTERISTICAS_P) ones(1, size(zrcepstrum, 2)) zeros(1, EXTRAE_CARACTERISTICAS_P)];
    delta = zeros(size(rcepstrum));
    for i=EXTRAE_CARACTERISTICAS_P+1:size(zrcepstrum, 2)-EXTRAE_CARACTERISTICAS_P
        delta(:, i-EXTRAE_CARACTERISTICAS_P) = sum((zrcepstrum(:, i-EXTRAE_CARACTERISTICAS_P:i+EXTRAE_CARACTERISTICAS_P) .* p), 2) ./ sum((valores_p(i-EXTRAE_CARACTERISTICAS_P:i+EXTRAE_CARACTERISTICAS_P).*p(1, :)) .^2);
    end
    
    %%
    % Creamos la matriz de características y normalizamos
    caracteristicas = [rcepstrum; delta];
    
    caracteristicas = (caracteristicas - ... 
        repmat(mean(caracteristicas), size(caracteristicas, 1), 1)) ...
        ./ repmat(std(caracteristicas), size(caracteristicas, 1), 1);
end

