global DETECTA_PALABRA_segmentos_ruido
global EXTRAE_CARACTERISTICAS_tiempo_ventana
global EXTRAE_CARACTERISTICAS_P
global DTW_tipo
global DTW_w
global FRECUENCIA_DE_MUESTREO
global GRABACION_tiempo
global GRABACION_Channel
global PATRONES_arribaC;
global PATRONES_centroC;
global PATRONES_abajoC;
global PATRONES_izdaC;
global PATRONES_dchaC;
global PATRONES_siC;
global PATRONES_noC;
global PATRONES_sonido_si;
global PATRONES_sonido_no;
global PATRONES_sonido_arriba;
global PATRONES_sonido_centro;
global PATRONES_sonido_abajo;
global PATRONES_sonido_izda;
global PATRONES_sonido_dcha;

global PREENFASIS_a
global SEGMENTACION_desplazamiento
global SEGMENTACION_tam_segmento
global tiempo_entre_jugadas
global tiempo_confirmacion
global VENTANA
global jugador
global matriz_tablero
global contador_partidas

DTW_tipo = 1;
DTW_w = 5;
VENTANA='hamming';
DETECTA_PALABRA_segmentos_ruido=10;
DETECTA_PALABRA_pintar=0;
GRABACION_tiempo=1;
FRECUENCIA_DE_MUESTREO=8000;
GRABACION_Channel=1;
SEGMENTACION_desplazamiento=50;
SEGMENTACION_tam_segmento=100;
PREENFASIS_a=0.9;
EXTRAE_CARACTERISTICAS_tiempo_ventana=0.03;
EXTRAE_CARACTERISTICAS_P=4;
tiempo_entre_jugadas= 10;
tiempo_confirmacion = 5;

save('pordefecto.mat','DETECTA_PALABRA_segmentos_ruido','EXTRAE_CARACTERISTICAS_P','EXTRAE_CARACTERISTICAS_tiempo_ventana','VENTANA','FRECUENCIA_DE_MUESTREO','GRABACION_tiempo', ...
   'PREENFASIS_a','SEGMENTACION_desplazamiento','SEGMENTACION_tam_segmento','tiempo_entre_jugadas', 'tiempo_confirmacion')

