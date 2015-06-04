function [ error ] = dtw_restringido( patron, test, w )
    %%
    % Inicializamos constantes
    % n: segmentos del patron
    % m: segmentos del test
    % w: tamaño de la ventana de restricciones
    n = size(patron, 2);
    m = size(test, 2);
    w = max([w abs(n-m)]);
    
    %%
    % Inicializamos la matriz DTW
    dtwm = inf * ones(n, m);
    dtwm(1, 1) = 0;
    
    %%
    % Emparejamos
    for i=2:n
        for j=max([2 i-w]):min([m i+w])
            dist = euclidea(patron(:, i), test(:, j));
            dtwm(i, j) = dist + min([dtwm(i-1, j) dtwm(i, j-1) dtwm(i-1, j-1)]);
        end
    end
    
    error = dtwm(n, m);
end

