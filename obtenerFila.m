function [ f ] = obtenerFila( t )
    global PATRONES_arribaC;
    global PATRONES_centroC;
    global PATRONES_abajoC;
    global FRECUENCIA_DE_MUESTREO
    global DTW_tipo
    global DTW_w
    
    recObj = audiorecorder(FRECUENCIA_DE_MUESTREO, 16, 1);
    record(recObj);
    
    h = waitbar(0, 'Di la FILA (arriba, centro, abajo)...');
    for i = 1:t*10
        pause(0.1);
        h = waitbar(i/(t*10), h);
    end
    close(gcf);
    
    stop(recObj);
    fila = getaudiodata(recObj);
    filaC = extrae_caracteristicas(fila);

    
    arribaError = inf;
    abajoError  = inf;
    centroError = inf;
    if (DTW_tipo == 1)
        for i=1:length(PATRONES_arribaC)
            arribaError = min([arribaError dtw(PATRONES_arribaC{i}, filaC)]);
        end
        
        for i=1:length(PATRONES_centroC)
            centroError = min([centroError dtw(PATRONES_centroC{i}, filaC)]);
        end
        
        for i=1:length(PATRONES_abajoC)
            abajoError = min([abajoError dtw(PATRONES_abajoC{i}, filaC)]);
        end
    else
        for i=1:length(PATRONES_arribaC)
            arribaError = min([arribaError dtw_restringido(PATRONES_arribaC{i}, filaC, DTW_w)]);
        end
        
        for i=1:length(PATRONES_centroC)
            centroError = min([centroError dtw_restringido(PATRONES_centroC{i}, filaC, DTW_w)]);
        end
        
        for i=1:length(PATRONES_abajoC)
            abajoError = min([abajoError dtw_restringido(PATRONES_abajoC{i}, filaC, DTW_w)]);
        end
    end
    
    [~, f] = min([arribaError centroError abajoError]);
end