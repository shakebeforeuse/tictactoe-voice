function [ formantes ] = formantes( segmentosPalabraEnventanadas, Fs, num_puntos, orden, num_formantes )
    formantes = zeros(size(segmentosPalabraEnventanadas, 2), num_formantes);

    for i = 1:size(segmentosPalabraEnventanadas, 2)
        % Cálculo de los coeficientes
        lpcoefs = lpc(segmentosPalabraEnventanadas(:, i), orden);

        % Estimación de la señal
        estsenal = filter(0 - lpcoefs(2:end), 1, [segmentosPalabraEnventanadas(:,i); zeros(orden,1)]);
        % Error
        error = [segmentosPalabraEnventanadas(:,i); zeros(orden,1)] - estsenal;

        % Ganancia del filtro LPC
        G = sqrt(sum(error .^ 2));

        % Respuesta en frecuencia del sistema
        H = freqz(G, lpcoefs, round(num_puntos / 2) + 1);
        frecuencias = linspace(0, Fs / 2, (num_puntos / 2) + 1);
        amplitudes = abs(H);

        [~, indices] = findpeaks(amplitudes);
        formantes(i, :) = frecuencias(indices(1:num_formantes));
    end
end

