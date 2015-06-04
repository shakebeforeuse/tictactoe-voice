%% Reconocimiento del inicio y fin de una palabra
%  Percepción - Manuel Francisco
function [ palabra, sonido ] = detectaPalabra(t, Fs, Ch, a, tam_segmento, despl, num_segmentos_ruido, pintar)
    if (nargin < 8)
        t                   = 1;
        Fs                  = 8000;
        Ch                  = 1;
        a                   = 0.9;
        tam_segmento        = 100;
        despl               = 50;
        num_segmentos_ruido = 10;
        pintar              = 1;
    end
    
    %%
    %  Capturamos la señal de audio.
    disp('Grabando...');
    sonido = grabacion(t, Fs, Ch);
    disp('Fin grabación');

    %%
    %  Aplicamos el filtro preénfasis.
    y = preenfasis(sonido, a);

    %%
    %  Segmentamos la señal.
    segmentos    = segmentacion(y, tam_segmento, despl);

    %%
    %  Calculamos magnitud y tasa de cruces por cero de los segmentos.
    magni = magnitud(segmentos, 'hamming');
    tcc   = cruces_por_cero(segmentos, 'hamming');

    %%
    %  Aplicamos una adaptación del algoritmo de Rabiner-Sambur para detectar
    %  el inicio y el fin de una palabra.
    [segmentosPalabra, inicio, fin] = inicio_fin(segmentos, num_segmentos_ruido);

    %%
    % Invertimos los segmentos y dibujamos.
    palabra = inv_segmentacion(segmentosPalabra, despl);
    
    if (pintar)
        %%
        % Buscamos el punto de inicio y de fin (para mostrar en gráfica)
        inicio_sonido = strfind(y', segmentosPalabra(:, 1)');
        fin_sonido    = strfind(y', segmentosPalabra(:, end)');

        %%
        % Hallamos el valor de los umbrales (para mostrar en gráfica)
        Ms = magni(1:num_segmentos_ruido);
        Zs = tcc(1:num_segmentos_ruido);
        UmbSupEnrg = .5 * max(magni);
        UmbInfEnrg = mean(Ms) + 2 * std(Ms);
        UmbCruCero = mean(Zs) + 2 * std(Zs);

        %%
        % Dibujamos las gráficas
        subplot(3, 1, 1);
        plot(sonido);
        legend('Señal');
        % Lineas verticales para delimitar la palabra (R2014a)
        hx = graph2d.constantline(inicio_sonido(1), 'LineStyle', ':', 'Color', 'red');
        changedependvar(hx, 'x');
        hx = graph2d.constantline(fin_sonido(1), 'LineStyle', ':', 'Color', 'red');
        changedependvar(hx,'x');

        subplot(3, 1, 2);
        plot(magni);
        legend('Magnitud');
        ylim([min(magni)-mean(magni) max(magni)+mean(magni)]);
        % Lineas verticales para delimitar la palabra (R2014a)
        hx = graph2d.constantline(inicio, 'LineStyle', ':', 'Color', 'red');
        changedependvar(hx, 'x');
        hx = graph2d.constantline(fin, 'LineStyle', ':', 'Color', 'red');
        changedependvar(hx,'x');
        % Lineas horizontales para marcar los umbrales (R2014a)
        hy = graph2d.constantline(UmbSupEnrg, 'LineStyle', ':', 'Color',  [.2 .2 .2]);
        changedependvar(hy, 'y');
        hy = graph2d.constantline(UmbInfEnrg, 'LineStyle', ':', 'Color',  [.2 .2 .2]);
        changedependvar(hy, 'y');

        subplot(3, 1, 3);
        plot(tcc);
        legend('Tasa de Cruces por Cero');
        % Lineas verticales para delimitar la palabra (R2014a)
        hx = graph2d.constantline(inicio, 'LineStyle', ':', 'Color', 'red');
        changedependvar(hx, 'x');
        hx = graph2d.constantline(fin, 'LineStyle', ':', 'Color', 'red');
        changedependvar(hx,'x');
        % Linea vertical para marcar el umbral (R2014a)
        hy = graph2d.constantline(UmbCruCero, 'LineStyle', ':', 'Color', [.2 .2 .2]);
        changedependvar(hy, 'y');
    end
end
