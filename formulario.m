function varargout = formulario(varargin)
% FORMULARIO MATLAB code for formulario.fig
%      FORMULARIO, by itself, creates a new FORMULARIO or raises the existing
%      singleton*.
%
%      H = FORMULARIO returns the handle to a new FORMULARIO or the handle to
%      the existing singleton*.
%
%      FORMULARIO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FORMULARIO.M with the given input arguments.
%
%      FORMULARIO('Property','Value',...) creates a new FORMULARIO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before formulario_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to formulario_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help formulario

% Last Modified by GUIDE v2.5 09-May-2015 20:28:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @formulario_OpeningFcn, ...
                   'gui_OutputFcn',  @formulario_OutputFcn, ...
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


% --- Executes just before formulario is made visible.
function formulario_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to formulario (see VARARGIN)

% Choose default command line output for formulario
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes formulario wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = formulario_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function preenfasis_Callback(hObject, eventdata, handles)
% hObject    handle to preenfasis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of preenfasis as text
%        str2double(get(hObject,'String')) returns contents of preenfasis as a double


% --- Executes during object creation, after setting all properties.
function preenfasis_CreateFcn(hObject, eventdata, handles)
% hObject    handle to preenfasis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global PREENFASIS_a
set(hObject,'String', PREENFASIS_a);


function segmentoruido_Callback(hObject, eventdata, handles)
% hObject    handle to segmentoruido (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of segmentoruido as text
%        str2double(get(hObject,'String')) returns contents of segmentoruido as a double

% --- Executes during object creation, after setting all properties.
function segmentoruido_CreateFcn(hObject, eventdata, handles)
% hObject    handle to segmentoruido (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

global DETECTA_PALABRA_segmentos_ruido
set(hObject, 'String', DETECTA_PALABRA_segmentos_ruido);

function P_Callback(hObject, eventdata, handles)
% hObject    handle to P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P as text
%        str2double(get(hObject,'String')) returns contents of P as a double


% --- Executes during object creation, after setting all properties.
function P_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global EXTRAE_CARACTERISTICAS_P
set(hObject, 'String', EXTRAE_CARACTERISTICAS_P);



function tiempoventana_Callback(hObject, eventdata, handles)
% hObject    handle to tiempoventana (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tiempoventana as text
%        str2double(get(hObject,'String')) returns contents of tiempoventana as a double


% --- Executes during object creation, after setting all properties.
function tiempoventana_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tiempoventana (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global EXTRAE_CARACTERISTICAS_tiempo_ventana
set(hObject,'String',EXTRAE_CARACTERISTICAS_tiempo_ventana);



function fs_Callback(hObject, eventdata, handles)
% hObject    handle to fs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fs as text
%        str2double(get(hObject,'String')) returns contents of fs as a double



% --- Executes during object creation, after setting all properties.
function fs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global FRECUENCIA_DE_MUESTREO
set(hObject,'String', FRECUENCIA_DE_MUESTREO);



function tiempo_Callback(hObject, eventdata, handles)
% hObject    handle to tiempo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tiempo as text
%        str2double(get(hObject,'String')) returns contents of tiempo as a double



% --- Executes during object creation, after setting all properties.
function tiempo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tiempo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

global GRABACION_tiempo
set(hObject,'String',GRABACION_tiempo);



function desplazamiento_Callback(hObject, eventdata, handles)
% hObject    handle to desplazamiento (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of desplazamiento as text
%        str2double(get(hObject,'String')) returns contents of desplazamiento as a double


% --- Executes during object creation, after setting all properties.
function desplazamiento_CreateFcn(hObject, eventdata, handles)
% hObject    handle to desplazamiento (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global SEGMENTACION_desplazamiento
set(hObject,'String', SEGMENTACION_desplazamiento);



function tamsegmento_Callback(hObject, eventdata, handles)
% hObject    handle to tamsegmento (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tamsegmento as text
%        str2double(get(hObject,'String')) returns contents of tamsegmento as a double


% --- Executes during object creation, after setting all properties.
function tamsegmento_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tamsegmento (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global SEGMENTACION_tam_segmento
set(hObject,'String', SEGMENTACION_tam_segmento);


function ventana_Callback(hObject, eventdata, handles)
% hObject    handle to ventana (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ventana as text
%        str2double(get(hObject,'String')) returns contents of ventana as a double


% --- Executes during object creation, after setting all properties.
function ventana_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ventana (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global VENTANA
set(hObject,'String',VENTANA);

% --- Executes on button press in guardar.
function guardar_Callback(hObject, eventdata, handles)
% hObject    handle to guardar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global DETECTA_PALABRA_segmentos_ruido
DETECTA_PALABRA_segmentos_ruido= str2double(get(handles.segmentoruido,'String'));
global EXTRAE_CARACTERISTICAS_P
EXTRAE_CARACTERISTICAS_P=str2double(get(handles.P,'String'));
global EXTRAE_CARACTERISTICAS_tiempo_ventana
EXTRAE_CARACTERISTICAS_tiempo_ventana =str2double(get(handles.tiempoventana,'String'));
global FRECUENCIA_DE_MUESTREO
FRECUENCIA_DE_MUESTREO =  str2double(get(handles.fs,'String'));
global GRABACION_tiempo
GRABACION_tiempo = str2double(get(handles.tiempo,'String'));
global GRABACION_Channel
GRABACION_Channel = str2double(get(handles.canales,'String'));
global PREENFASIS_a
PREENFASIS_a = str2double(get(handles.preenfasis,'String'));
global SEGMENTACION_desplazamiento
SEGMENTACION_desplazamiento = str2double(get(handles.desplazamiento,'String'));
global SEGMENTACION_tam_segmento
SEGMENTACION_tam_segmento = str2double(get(handles.tamsegmento,'String'));
global VENTANA
VENTANA = get(handles.ventana,'String');
global DTW_w
DTW_w = str2double(get(handles.dtww,'String'));
global DTW_tipo
global tiempo_entre_jugadas
tiempo_entre_jugadas = str2double(get(handles.tiempoentrejugadas,'String'));
global tiempo_confirmacion
tiempo_confirmacion = str2double(get(handles.tiempoconfirmacion, 'String'));
global PATRONES_arribaC
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

save('globales.mat','DETECTA_PALABRA_segmentos_ruido', ...
    'EXTRAE_CARACTERISTICAS_P','EXTRAE_CARACTERISTICAS_tiempo_ventana', ...
    'FRECUENCIA_DE_MUESTREO','GRABACION_tiempo', 'GRABACION_Channel', ...
    'PREENFASIS_a','SEGMENTACION_desplazamiento', ...
    'SEGMENTACION_tam_segmento', 'PATRONES_arribaC', 'PATRONES_centroC', ...
    'PATRONES_abajoC', 'PATRONES_izdaC','PATRONES_dchaC', 'PATRONES_siC', ...
    'PATRONES_noC', 'PATRONES_sonido_si', 'PATRONES_sonido_no', ...
    'PATRONES_sonido_arriba', 'PATRONES_sonido_abajo', ...
    'PATRONES_sonido_centro', 'PATRONES_sonido_izda', 'PATRONES_sonido_dcha', ...
    'tiempo_entre_jugadas', 'tiempo_confirmacion', 'VENTANA', 'DTW_w', ...
    'DTW_tipo');


% --- Executes on button press in pordefecto.
function pordefecto_Callback(hObject, eventdata, handles)
% hObject    handle to pordefecto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
command = sprintf('load(''%s'')', 'pordefecto.mat');
evalin('base', command);
global DETECTA_PALABRA_segmentos_ruido
set(handles.segmentoruido, 'String', DETECTA_PALABRA_segmentos_ruido);
global EXTRAE_CARACTERISTICAS_P
set(handles.P, 'String', EXTRAE_CARACTERISTICAS_P);
global EXTRAE_CARACTERISTICAS_tiempo_ventana
set(handles.tiempoventana,'String',EXTRAE_CARACTERISTICAS_tiempo_ventana);
global FRECUENCIA_DE_MUESTREO
set(handles.fs,'String', FRECUENCIA_DE_MUESTREO);
global GRABACION_tiempo
set(handles.tiempo,'String',GRABACION_tiempo);
global GRABACION_Channel
set(handles.canales,'String',GRABACION_Channel);
global PREENFASIS_a
set(handles.preenfasis,'String', PREENFASIS_a);
global SEGMENTACION_desplazamiento
set(handles.desplazamiento,'String', SEGMENTACION_desplazamiento);
global SEGMENTACION_tam_segmento
set(handles.tamsegmento,'String', SEGMENTACION_tam_segmento);
global VENTANA
set(handles.ventana,'String',VENTANA);
global tiempo_entre_jugadas
set(handles.tiempoentrejugadas, 'String', tiempo_entre_jugadas);
global tiempo_confirmacion
set(handles.tiempoconfirmacion, 'String', tiempo_confirmacion);
global DTW_w
set(handles.dtww, 'String', DTW_w);

% --- Executes on button press in grabararriba.
function grabararriba_Callback(hObject, eventdata, handles)
% hObject    handle to grabararriba (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global GRABACION_tiempo;
global FRECUENCIA_DE_MUESTREO;
global PATRONES_arribaC
global PATRONES_sonido_arriba

recObj = audiorecorder(FRECUENCIA_DE_MUESTREO, 16, 1);
record(recObj);

h = waitbar(0, 'Di ARRIBA');
for i = 1:GRABACION_tiempo*10
    pause(0.1);
    h = waitbar(i/(GRABACION_tiempo*10), h);
end
close(gcf);

stop(recObj);
PATRONES_sonido_arriba = getaudiodata(recObj);
PATRONES_arribaC{1} = extrae_caracteristicas(PATRONES_sonido_arriba);

% --- Executes on button press in grabarizquierda.
function grabarizquierda_Callback(hObject, eventdata, handles)
% hObject    handle to grabarizquierda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global GRABACION_tiempo;
global FRECUENCIA_DE_MUESTREO;
global PATRONES_izdaC
global PATRONES_sonido_izda

recObj = audiorecorder(FRECUENCIA_DE_MUESTREO, 16, 1);
record(recObj);

h = waitbar(0, 'Di IZQUIERDA');
for i = 1:GRABACION_tiempo*10
    pause(0.1);
    h = waitbar(i/(GRABACION_tiempo*10), h);
end
close(gcf);

stop(recObj);

PATRONES_sonido_izda = getaudiodata(recObj);
PATRONES_izdaC{1} = extrae_caracteristicas(PATRONES_sonido_izda);

% --- Executes on button press in grabarabajo.
function grabarabajo_Callback(hObject, eventdata, handles)
% hObject    handle to grabarabajo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global GRABACION_tiempo;
global FRECUENCIA_DE_MUESTREO;
global PATRONES_abajoC
global PATRONES_sonido_abajo

recObj = audiorecorder(FRECUENCIA_DE_MUESTREO, 16, 1);
record(recObj);

h = waitbar(0, 'Di ABAJO');
for i = 1:GRABACION_tiempo*10
    pause(0.1);
    h = waitbar(i/(GRABACION_tiempo*10), h);
end
close(gcf);

stop(recObj);
PATRONES_sonido_abajo = getaudiodata(recObj);
PATRONES_abajoC{1} = extrae_caracteristicas(PATRONES_sonido_abajo);

% --- Executes on button press in grabarderecha.
function grabarderecha_Callback(hObject, eventdata, handles)
% hObject    handle to grabarderecha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global GRABACION_tiempo;
global FRECUENCIA_DE_MUESTREO;
global PATRONES_dchaC
global PATRONES_sonido_dcha

recObj = audiorecorder(FRECUENCIA_DE_MUESTREO, 16, 1);
record(recObj);

h = waitbar(0, 'Di DERECHA');
for i = 1:GRABACION_tiempo*10
    pause(0.1);
    h = waitbar(i/(GRABACION_tiempo*10), h);
end
close(gcf);

stop(recObj);
PATRONES_sonido_dcha = getaudiodata(recObj);
PATRONES_dchaC{1} = extrae_caracteristicas(PATRONES_sonido_dcha);

% --- Executes on button press in grabarno.
function grabarno_Callback(hObject, eventdata, handles)
% hObject    handle to grabarno (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global GRABACION_tiempo;
global FRECUENCIA_DE_MUESTREO;
global PATRONES_noC
global PATRONES_sonido_no

recObj = audiorecorder(FRECUENCIA_DE_MUESTREO, 16, 1);
record(recObj);

h = waitbar(0, 'Di NO');
for i = 1:GRABACION_tiempo*10
    pause(0.1);
    h = waitbar(i/(GRABACION_tiempo*10), h);
end
close(gcf);

stop(recObj);
PATRONES_sonido_no = getaudiodata(recObj);
PATRONES_noC{1} = extrae_caracteristicas(PATRONES_sonido_no);

% --- Executes on button press in grabarsi.
function grabarsi_Callback(hObject, eventdata, handles)
% hObject    handle to grabarsi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global GRABACION_tiempo;
global FRECUENCIA_DE_MUESTREO;
global PATRONES_siC
global PATRONES_sonido_si

recObj = audiorecorder(FRECUENCIA_DE_MUESTREO, 16, 1);
record(recObj);

h = waitbar(0, 'Di SI');
for i = 1:GRABACION_tiempo*10
    pause(0.1);
    h = waitbar(i/(GRABACION_tiempo*10), h);
end
close(gcf);

stop(recObj);
PATRONES_sonido_si = getaudiodata(recObj);
PATRONES_siC{1} = extrae_caracteristicas(PATRONES_sonido_si);


% --- Executes on button press in centro.
function centro_Callback(hObject, eventdata, handles)
% hObject    handle to centro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global GRABACION_tiempo;
global FRECUENCIA_DE_MUESTREO;
global PATRONES_centroC
global PATRONES_sonido_centro

recObj = audiorecorder(FRECUENCIA_DE_MUESTREO, 16, 1);
record(recObj);

h = waitbar(0, 'Di CENTRO');
for i = 1:GRABACION_tiempo*10
    pause(0.1);
    h = waitbar(i/(GRABACION_tiempo*10), h);
end
close(gcf);

stop(recObj);
PATRONES_sonido_centro = getaudiodata(recObj);
PATRONES_centroC{1} = extrae_caracteristicas(PATRONES_sonido_centro);


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
command = sprintf('load(''%s'')', 'globales.mat');
evalin('base', command);


% --- Executes during object creation, after setting all properties.
function tiempoentrejugadas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tiempoentrejugadas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global tiempo_entre_jugadas;
set(hObject, 'String', tiempo_entre_jugadas);



function tiempoentrejugadas_Callback(hObject, eventdata, handles)
% hObject    handle to tiempoentrejugadas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tiempoentrejugadas as text
%        str2double(get(hObject,'String')) returns contents of tiempoentrejugadas as a double



function tiempoconfirmacion_Callback(hObject, eventdata, handles)
% hObject    handle to tiempoconfirmacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tiempoconfirmacion as text
%        str2double(get(hObject,'String')) returns contents of tiempoconfirmacion as a double


% --- Executes during object creation, after setting all properties.
function tiempoconfirmacion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tiempoconfirmacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global tiempo_confirmacion
set(hObject, 'String', tiempo_confirmacion);



function canales_Callback(hObject, eventdata, handles)
% hObject    handle to canales (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of canales as text
%        str2double(get(hObject,'String')) returns contents of canales as a double


% --- Executes during object creation, after setting all properties.
function canales_CreateFcn(hObject, eventdata, handles)
% hObject    handle to canales (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global GRABACION_Channel
set(hObject, 'String', GRABACION_Channel);



function dtww_Callback(hObject, eventdata, handles)
% hObject    handle to dtww (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dtww as text
%        str2double(get(hObject,'String')) returns contents of dtww as a double


% --- Executes during object creation, after setting all properties.
function dtww_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dtww (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global DTW_w
global DTW_tipo
set(hObject, 'String', DTW_w);
if (DTW_tipo == 2)
    set(hObject, 'Enable', 'on');
else
    set(hObject, 'Enable', 'off');
end


% --- Executes on button press in dtwrestringido.
function dtwrestringido_Callback(hObject, eventdata, handles)
% hObject    handle to dtwrestringido (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of dtwrestringido
global DTW_tipo

if (get(hObject, 'Value'))
    set([handles.wtext handles.dtww], 'Enable', 'on');
    DTW_tipo = 2;
else
    set([handles.wtext handles.dtww], 'Enable', 'off');
    DTW_tipo = 1;
end


% --- Executes during object creation, after setting all properties.
function wtext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wtext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global DTW_tipo

if (DTW_tipo == 2)
    set(hObject, 'Enable', 'on');
else
    set(hObject, 'Enable', 'off');
end


% --- Executes during object creation, after setting all properties.
function dtwrestringido_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dtwrestringido (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global DTW_tipo

if (DTW_tipo == 2)
    set(hObject, 'Value', 1);
end
