function [ c ] = obtenerColumna( t )
    global PATRONES_izdaC;
    global PATRONES_centroC;
    global PATRONES_dchaC;
    global FRECUENCIA_DE_MUESTREO
    global DTW_tipo
    global DTW_w
    
    recObj = audiorecorder(FRECUENCIA_DE_MUESTREO, 16, 1);
    record(recObj);
    
    h = waitbar(0, 'Di la COLUMNA (izquierda, centro, derecha)...');
    for i = 1:t*10
        pause(0.1);
        h = waitbar(i/(t*10), h);
    end
    close(gcf);
    
    stop(recObj);
    columna = getaudiodata(recObj);
    columnaC = extrae_caracteristicas(columna);    
    
    izdaError = inf;
    dchaError  = inf;
    centroError = inf;
    if (DTW_tipo == 1)
        for i=1:length(PATRONES_izdaC)
            izdaError = min([izdaError dtw(PATRONES_izdaC{i}, columnaC)]);
        end
        
        for i=1:length(PATRONES_centroC)
            centroError = min([centroError dtw(PATRONES_centroC{i}, columnaC)]);
        end
        
        for i=1:length(PATRONES_dchaC)
            dchaError = min([dchaError dtw(PATRONES_dchaC{i}, columnaC)]);
        end
    else
        for i=1:length(PATRONES_izdaC)
            izdaError = min([izdaError dtw_restringido(PATRONES_izdaC{i}, columnaC, DTW_w)]);
        end
        
        for i=1:length(PATRONES_centroC)
            centroError = min([centroError dtw_restringido(PATRONES_centroC{i}, columnaC, DTW_w)]);
        end
        
        for i=1:length(PATRONES_dchaC)
            dchaError = min([dchaError dtw_restringido(PATRONES_dchaC{i}, columnaC, DTW_w)]);
        end
    end
    
    [~, c] = min([izdaError centroError dchaError]);
end