function varargout = tablero(varargin)
% TABLERO MATLAB code for tablero.fig
%      TABLERO, by itself, creates a new TABLERO or raises the existing
%      singleton*.
%
%      H = TABLERO returns the handle to a new TABLERO or the handle to
%      the existing singleton*.
%
%      TABLERO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TABLERO.M with the given input arguments.
%
%      TABLERO('Property','Value',...) creates a new TABLERO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tablero_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tablero_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tablero

% Last Modified by GUIDE v2.5 09-May-2015 17:21:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tablero_OpeningFcn, ...
                   'gui_OutputFcn',  @tablero_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before tablero is made visible.
function tablero_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tablero (see VARARGIN)

% Choose default command line output for tablero
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tablero wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tablero_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in resetbutton.
function gamebutton_Callback(hObject, eventdata, handles)
% hObject    handle to resetbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FRECUENCIA_DE_MUESTREO
global GRABACION_tiempo
global tiempo_entre_jugadas
global tiempo_confirmacion
global matriz_tablero
global contador_partidas
global PATRONES_siC
global PATRONES_noC
global jugador
global DTW_tipo
global DTW_w

winner = ganador(matriz_tablero);
recObj = audiorecorder(FRECUENCIA_DE_MUESTREO, 16, 1);
while (winner == inf)
    h = waitbar(0, 'Esperando...');
    for i = 1:tiempo_entre_jugadas*10
        pause(0.1);
        h = waitbar(i/(tiempo_entre_jugadas*10), h);
    end
    close(gcf);
    f = obtenerFila(GRABACION_tiempo);
    c = obtenerColumna(GRABACION_tiempo);
    
    switch (f)
        case 1
            fr = 'arriba';
        case 2
            fr = 'centro';
        case 3
            fr = 'abajo';
    end
    
    switch (c)
        case 1
            cr = 'izquierda';
        case 2
            cr = 'centro';
        case 3
            cr = 'derecha';
    end
    
    h = waitbar(0, ['Fila ' fr ' Columna ' cr]);
    for i = 1:tiempo_confirmacion*10
        pause(0.1);
        h = waitbar(i/(tiempo_confirmacion*10), h);
    end
    close(gcf);
    
    record(recObj);
    
    h = waitbar(0, '¿Confirmar?');
    for i = 1:GRABACION_tiempo*10
        pause(0.1);
        h = waitbar(i/(GRABACION_tiempo*10), h);
    end
    close(gcf);
    
    stop(recObj);
    confirmacion = getaudiodata(recObj);
    confirmacionC = extrae_caracteristicas(confirmacion);

    siError = inf;
    noError = inf;
    if (DTW_tipo == 1)
        for i=1:length(PATRONES_siC)
            siError = min([siError dtw(PATRONES_siC{i}, confirmacionC)]);
        end
        
        for i=1:length(PATRONES_noC)
            noError = min([noError dtw(PATRONES_noC{i}, confirmacionC)]);
        end
    else
        for i=1:length(PATRONES_siC)
            siError = min([siError dtw_restringido(PATRONES_siC{i}, confirmacionC, DTW_w)]);
        end
        
        for i=1:length(PATRONES_noC)
            noError = min([noError dtw_restringido(PATRONES_noC, confirmacionC{i}, DTW_w)]);
        end
    end
    
    [~, r] = min([siError noError]);
    
    if (r == 1)
        if (matriz_tablero(f, c) == 0)
            matriz_tablero(f, c) = jugador;
            marcarJugada(handles, f, c, jugador);
            jugador = jugador*-1;
            winner = ganador(matriz_tablero);
            
            
            % IA activada
            if (winner == inf && get(handles.vsia, 'Value'))
                [~, x, y] = minimax(matriz_tablero, jugador);
                matriz_tablero(x, y) = jugador;
                marcarJugada(handles, x, y, jugador);
                jugador = jugador*-1;
                winner = ganador(matriz_tablero);
            end
            
            
            if (winner ~= inf)
                switch (winner)
                    case 0
                    case 1
                        contador_partidas(1) = contador_partidas(1) + 1;
                        set(handles.contador1, 'String', contador_partidas(1));
                    case -1
                        contador_partidas(2) = contador_partidas(2) + 1;
                        set(handles.contador2, 'String', contador_partidas(2));
                end
            end
        end
    end
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.resetbutton, 'UserData', 1);


% --- Executes on button press in botonfila.
function botonfila_Callback(hObject, eventdata, handles)
% hObject    handle to botonfila (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global GRABACION_tiempo
f = obtenerFila(GRABACION_tiempo);

set(handles.texto_fila_reconocida, 'UserData', f);

switch (f)
    case 1
        set(handles.texto_fila_reconocida, 'String', 'Arriba');
    case 2
        set(handles.texto_fila_reconocida, 'String', 'Centro');
    case 3
        set(handles.texto_fila_reconocida, 'String', 'Abajo');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in botoncolumna.
function botoncolumna_Callback(hObject, eventdata, handles)
% hObject    handle to botonfila (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global GRABACION_tiempo
c = obtenerColumna(GRABACION_tiempo);

set(handles.texto_columna_reconocida, 'UserData', c);

switch (c)
    case 1
        set(handles.texto_columna_reconocida, 'String', 'Izquierda');
    case 2
        set(handles.texto_columna_reconocida, 'String', 'Centro');
    case 3
        set(handles.texto_columna_reconocida, 'String', 'Derecha');
end

% --- Executes on button press in botonconfirmar.
function botonconfirmar_Callback(hObject, eventdata, handles)
% hObject    handle to botonconfirmar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global matriz_tablero
global jugador
global contador_partidas

if (ganador(matriz_tablero) == inf)
    f = get(handles.texto_fila_reconocida, 'UserData');
    c = get(handles.texto_columna_reconocida, 'UserData');
    if (matriz_tablero(f, c) == 0)
        matriz_tablero(f, c) = jugador;
        marcarJugada(handles, f, c, jugador);
        jugador = jugador*-1;
        winner = ganador(matriz_tablero);
        
        % IA activada
        if (winner == inf && get(handles.vsia, 'Value'))
            [~, x, y] = minimax(matriz_tablero, jugador);
            matriz_tablero(x, y) = jugador;
            marcarJugada(handles, x, y, jugador);
            jugador = jugador*-1;
            winner = ganador(matriz_tablero);
        end
        
        
        if (winner ~= inf)
            switch (winner)
                case 0
                case 1
                    contador_partidas(1) = contador_partidas(1) + 1;
                    set(handles.contador1, 'String', contador_partidas(1));
                case -1
                    contador_partidas(2) = contador_partidas(2) + 1;
                    set(handles.contador2, 'String', contador_partidas(2));
            end
        end
    end
end


% --- Executes on button press in jugadarapida.
function jugadarapida_Callback(hObject, eventdata, handles)
% hObject    handle to jugadarapida (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of jugadarapida
listaObj = [handles.texto_fila_reconocida handles.texto_columna_reconocida ...
    handles.botonfila handles.botoncolumna handles.botonconfirmar];
switch (get(hObject, 'Value'))
    case 0
        set(listaObj, 'Enable', 'on');
        set(handles.gamebutton, 'Enable', 'off');
    case 1
        set(listaObj, 'Enable', 'off');
        set(handles.gamebutton, 'Enable', 'on');
end


% --- Executes on button press in gamebutton.
function resetbutton_Callback(hObject, eventdata, handles)
% hObject    handle to gamebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global matriz_tablero
global jugador
matriz_tablero = zeros(3, 3);
jugador = 1;
for i=[handles.arribaizquierda handles.arribacentro handles.arribaderecha ...
    handles.centroizquierda handles.centrocentro handles.centroderecha ...
    handles.abajoizquierda handles.abajocentro handles.abajoderecha]
    set(i, 'String', '');
end


% --- Executes during object creation, after setting all properties.
function contador1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to contador1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global contador_partidas
set(hObject, 'String', contador_partidas(1));


% --- Executes during object creation, after setting all properties.
function contador2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to contador2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global contador_partidas
set(hObject, 'String', contador_partidas(2));


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global jugador
global matriz_tablero
global contador_partidas

command = sprintf('load(''%s'')', 'globales.mat');
evalin('base', command);

matriz_tablero = zeros(3, 3);
jugador = 1;
contador_partidas = zeros(1, 2);


% --- Executes on button press in vsia.
function vsia_Callback(hObject, eventdata, handles)
% hObject    handle to vsia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of vsia
