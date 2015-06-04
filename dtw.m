function [ error ] = dtw( patron, test )
    %%
    % Inicializamos constantes
    % n: segmentos del patron
    % m: segmentos del test
    n = size(patron, 2);
    m = size(test, 2);
    
    %%
    % Inicializamos la matriz DTW
    dtwm = zeros(n, m);
    for i=1:n
        dtwm(i, 1) = inf;
    end
    
    for i=1:m
        dtwm(1, i) = inf;
    end
    
    dtwm(1, 1) = 0;
    
    %%
    % Emparejamos
    for i=2:n
        for j=2:m
            dist = euclidea(patron(:, i), test(:, j));
            dtwm(i, j) = dist + min([dtwm(i-1, j) dtwm(i, j-1) dtwm(i-1, j-1)]);
        end
    end
    
    error = dtwm(n, m);
end

