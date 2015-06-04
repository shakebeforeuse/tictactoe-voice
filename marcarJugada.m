function [] = marcarJugada(handles, f, c, jugador)
    switch (3*(f-1)+c)
        case 1,
            if (jugador == -1)
                set(handles.arribaizquierda, 'String', 'O');
                set(handles.arribaizquierda, 'ForegroundColor', 'red');
            else
                set(handles.arribaizquierda, 'String', 'X');
                set(handles.arribaizquierda, 'ForegroundColor', 'blue');
            end
        case 2,
            if (jugador == -1)
                set(handles.arribacentro, 'String', 'O');
                set(handles.arribacentro, 'ForegroundColor', 'red');
            else
                set(handles.arribacentro, 'String', 'X');
                set(handles.arribacentro, 'ForegroundColor', 'blue');
            end
        case 3
            if (jugador == -1)
                set(handles.arribaderecha, 'String', 'O');
                set(handles.arribaderecha, 'ForegroundColor', 'red');
            else
                set(handles.arribaderecha, 'String', 'X');
                set(handles.arribaderecha, 'ForegroundColor', 'blue');
            end
        case 4
            if (jugador == -1)
                set(handles.centroizquierda, 'String', 'O');
                set(handles.centroizquierda, 'ForegroundColor', 'red');
            else
                set(handles.centroizquierda, 'String', 'X');
                set(handles.centroizquierda, 'ForegroundColor', 'blue');
            end
        case 5
            if (jugador == -1)
                set(handles.centrocentro, 'String', 'O');
                set(handles.centrocentro, 'ForegroundColor', 'red');
            else
                set(handles.centrocentro, 'String', 'X');
                set(handles.centrocentro, 'ForegroundColor', 'blue');
            end
        case 6
            if (jugador == -1)
                set(handles.centroderecha, 'String', 'O');
                set(handles.centroderecha, 'ForegroundColor', 'red');
            else
                set(handles.centroderecha, 'String', 'X');
                set(handles.centroderecha, 'ForegroundColor', 'blue');
            end
        case 7
            if (jugador == -1)
                set(handles.abajoizquierda, 'String', 'O');
                set(handles.abajoizquierda, 'ForegroundColor', 'red');
            else
                set(handles.abajoizquierda, 'String', 'X');
                set(handles.abajoizquierda, 'ForegroundColor', 'blue');
            end
        case 8
            if (jugador == -1)
                set(handles.abajocentro, 'String', 'O');
                set(handles.abajocentro, 'ForegroundColor', 'red');
            else
                set(handles.abajocentro, 'String', 'X');
                set(handles.abajocentro, 'ForegroundColor', 'blue');
            end
        case 9
            if (jugador == -1)
                set(handles.abajoderecha, 'String', 'O');
                set(handles.abajoderecha, 'ForegroundColor', 'red');
            else
                set(handles.abajoderecha, 'String', 'X');
                set(handles.abajoderecha, 'ForegroundColor', 'blue');
            end
    end
end