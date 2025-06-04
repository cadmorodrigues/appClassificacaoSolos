function varargout = Principal_Solos(varargin)
% PRINCIPAL_SOLOS MATLAB code for Principal_Solos.fig
%      PRINCIPAL_SOLOS, by itself, creates a new PRINCIPAL_SOLOS or raises the existing
%      singleton*.
%
%      H = PRINCIPAL_SOLOS returns the handle to a new PRINCIPAL_SOLOS or the handle to
%      the existing singleton*.
%
%      PRINCIPAL_SOLOS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRINCIPAL_SOLOS.M with the given input arguments.
%
%      PRINCIPAL_SOLOS('Property','Value',...) creates a new PRINCIPAL_SOLOS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Principal_Solos_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Principal_Solos_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Principal_Solos

% Last Modified by GUIDE v2.5 17-Apr-2018 20:03:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Principal_Solos_OpeningFcn, ...
                   'gui_OutputFcn',  @Principal_Solos_OutputFcn, ...
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


% --- Executes just before Principal_Solos is made visible.
function Principal_Solos_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Principal_Solos (see VARARGIN)

% Choose default command line output for Principal_Solos
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Principal_Solos wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Principal_Solos_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in TRB_botao.
function TRB_botao_Callback(hObject, eventdata, handles)
% hObject    handle to TRB_botao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of TRB_botao


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over TRB_botao.
function TRB_botao_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to TRB_botao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function m_arquivo_Callback(hObject, eventdata, handles)
% hObject    handle to m_arquivo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function TRB_P200_Callback(hObject, eventdata, handles)
% hObject    handle to TRB_P200 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TRB_P200 as text
%        str2double(get(hObject,'String')) returns contents of TRB_P200 as a double


% --- Executes during object creation, after setting all properties.
function TRB_P200_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TRB_P200 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function USC_LP_Callback(hObject, eventdata, handles)
% hObject    handle to USC_LP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of USC_LP as text
%        str2double(get(hObject,'String')) returns contents of USC_LP as a double


% --- Executes during object creation, after setting all properties.
function USC_LP_CreateFcn(hObject, eventdata, handles)
% hObject    handle to USC_LP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function USC_LL_Callback(hObject, eventdata, handles)
% hObject    handle to USC_LL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of USC_LL as text
%        str2double(get(hObject,'String')) returns contents of USC_LL as a double


% --- Executes during object creation, after setting all properties.
function USC_LL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to USC_LL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function USC_P4_Callback(hObject, eventdata, handles)
% hObject    handle to USC_P4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of USC_P4 as text
%        str2double(get(hObject,'String')) returns contents of USC_P4 as a double


% --- Executes during object creation, after setting all properties.
function USC_P4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to USC_P4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function USC_P200_Callback(hObject, eventdata, handles)
% hObject    handle to USC_P200 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of USC_P200 as text
%        str2double(get(hObject,'String')) returns contents of USC_P200 as a double


% --- Executes during object creation, after setting all properties.
function USC_P200_CreateFcn(hObject, eventdata, handles)
% hObject    handle to USC_P200 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in USC_botao.
function USC_botao_Callback(hObject, eventdata, handles)
% hObject    handle to USC_botao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of USC_botao



function TRB_P10_Callback(hObject, eventdata, handles)
% hObject    handle to TRB_P10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TRB_P10 as text
%        str2double(get(hObject,'String')) returns contents of TRB_P10 as a double


% --- Executes during object creation, after setting all properties.
function TRB_P10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TRB_P10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TRB_P40_Callback(hObject, eventdata, handles)
% hObject    handle to TRB_P40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TRB_P40 as text
%        str2double(get(hObject,'String')) returns contents of TRB_P40 as a double


% --- Executes during object creation, after setting all properties.
function TRB_P40_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TRB_P40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TRB_LL_Callback(hObject, eventdata, handles)
% hObject    handle to TRB_LL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TRB_LL as text
%        str2double(get(hObject,'String')) returns contents of TRB_LL as a double


% --- Executes during object creation, after setting all properties.
function TRB_LL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TRB_LL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TRB_LP_Callback(hObject, eventdata, handles)
% hObject    handle to TRB_LP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TRB_LP as text
%        str2double(get(hObject,'String')) returns contents of TRB_LP as a double


% --- Executes during object creation, after setting all properties.
function TRB_LP_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TRB_LP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function USC_FI10_Callback(hObject, eventdata, handles)
% hObject    handle to USC_FI10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of USC_FI10 as text
%        str2double(get(hObject,'String')) returns contents of USC_FI10 as a double


% --- Executes during object creation, after setting all properties.
function USC_FI10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to USC_FI10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function USC_FI30_Callback(hObject, eventdata, handles)
% hObject    handle to USC_FI30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of USC_FI30 as text
%        str2double(get(hObject,'String')) returns contents of USC_FI30 as a double


% --- Executes during object creation, after setting all properties.
function USC_FI30_CreateFcn(hObject, eventdata, handles)
% hObject    handle to USC_FI30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function USC_FI60_Callback(hObject, eventdata, handles)
% hObject    handle to USC_FI60 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of USC_FI60 as text
%        str2double(get(hObject,'String')) returns contents of USC_FI60 as a double


% --- Executes during object creation, after setting all properties.
function USC_FI60_CreateFcn(hObject, eventdata, handles)
% hObject    handle to USC_FI60 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Classificar.
function Classificar_Callback(hObject, eventdata, handles)
verifica_TRB = get(handles.TRB_botao, 'Value');
verifica_USC = get(handles.USC_botao, 'Value');

% Método TRB
if ( verifica_TRB == 1 && verifica_USC == 0);
     f_TRB(handles);
end

% Método USC
if ( verifica_TRB == 0 && verifica_USC == 1);
     f_USC(handles);
end


% Nenhum método selecionado
if ( verifica_TRB == 1 && verifica_USC == 1);
    errordlg('Selecione apenas um método, por vez, para executar.','Erro!')
end
if ( verifica_TRB == 0 && verifica_USC == 0);
    errordlg('Selecione um método para executar.','Erro!')
end

function soloeh_Callback(hObject, eventdata, handles)
% hObject    handle to soloeh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of soloeh as text
%        str2double(get(hObject,'String')) returns contents of soloeh as a double


% --- Executes during object creation, after setting all properties.
function soloeh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to soloeh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function m_caracteristicas_Callback(hObject, eventdata, handles)
% hObject    handle to m_caracteristicas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function m_ajuda_Callback(hObject, eventdata, handles)
% hObject    handle to m_ajuda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function TRB_classificacao_Callback(hObject, eventdata, handles)
% hObject    handle to TRB_classificacao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function m_novo_Callback(hObject, eventdata, handles)
% Zerando dados iniciais
set(handles.TRB_P200, 'String', '');
set(handles.TRB_P40, 'String', '');
set(handles.TRB_P10, 'String', '');
set(handles.TRB_LL, 'String', '');
set(handles.TRB_LP, 'String', '');
set(handles.USC_P200, 'String', '');
set(handles.USC_P4, 'String', '');
set(handles.USC_LL, 'String', '');
set(handles.USC_LP, 'String', '');
set(handles.USC_FI10, 'String', '');
set(handles.USC_FI30, 'String', '');
set(handles.USC_FI60, 'String', '');
set(handles.soloeh, 'String', '');

% --------------------------------------------------------------------
function m_sair_Callback(hObject, eventdata, handles)
% Verificando se usuário tem certeza sobre encerrar o programa
op = questdlg('Desejas sair?')

% Encerrando em caso positivo
if (op == 'Yes')
    uiwait(msgbox('A execução do programa foi cancelada, agradecemos a utilização.', 'AVISO!'));
    exit();
end


% --------------------------------------------------------------------
function USC_classificacao_Callback(hObject, eventdata, handles)
% hObject    handle to USC_classificacao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function USC_codigos_Callback(hObject, eventdata, handles)
texto = sprintf ('G gravel Cascalho (pedregulho) \n S sand areia \n C clay argila \n W well graded bem graduado \n P poor graded mal graduado \n F fines finos (pás. # 200) \n M mo mó ou limo (areia fina) \n O organic matéria orgânica \n L low liquid limit LL baixo \n H high liquid limit LL alto \n Pt peat turfa');
msgbox(texto, 'Códigos da classificação USC');


% --------------------------------------------------------------------
function USC_pedregulhos_Callback(hObject, eventdata, handles)
texto = sprintf (' GW – CH: Pedregulho bem graduado com silte \n GW – GC: Pedregulho bem graduado com argila \n GP – GH: Pedregulho mal graduado com silte \n GP – GC: Pedregulho mal graduado com argila');
msgbox(texto, 'USC - Pedregulho');


% --------------------------------------------------------------------
function USC_areia_Callback(hObject, eventdata, handles)
texto = sprintf (' SW – SH: Areia bem graduada com silte \n SW – SC: Areia bem graduada com argila \n SP – SH: Areia mal graduada com silte \n SP – SC: Areia mal graduada com argila');
msgbox(texto, 'USC - Areia');


% --------------------------------------------------------------------
function TRB_A1_Callback(hObject, eventdata, handles)
texto = sprintf ('Solos granulares sem finos (pedregulho e areia grossa bem graduada, com pouca ou nenhuma plasticidade).');
msgbox(texto, 'TRB A.1');


% --------------------------------------------------------------------
function TRB_A2_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
function TRB_A24_Callback(hObject, eventdata, handles)
texto = sprintf ('Finos siltosos de baixa compressibilidade.');
msgbox(texto, 'TRB A.2-4');


% --------------------------------------------------------------------
function TRB_A25_Callback(hObject, eventdata, handles)
texto = sprintf ('Finos siltosos de alta compressibilidade.');
msgbox(texto, 'TRB A.2-5');


% --------------------------------------------------------------------
function TRB_A26_Callback(hObject, eventdata, handles)
texto = sprintf ('Finos argilosos de média plasticidade.');
msgbox(texto, 'TRB A.2-6');


% --------------------------------------------------------------------
function TRB_A27_Callback(hObject, eventdata, handles)
texto = sprintf ('Finos argilosos de alta plasticidade.');
msgbox(texto, 'TRB A.2-7');





% --------------------------------------------------------------------
function TRB_A3_Callback(hObject, eventdata, handles)
texto = sprintf ('Areias finas');
msgbox(texto, 'TRB A.3');


% --------------------------------------------------------------------
function TRB_A4_Callback(hObject, eventdata, handles)
texto = sprintf ('Solos siltosos com pequena quantidade de material grosso e de argila (baixa compressibilidade LL < 40%)');
msgbox(texto, 'TRB A.4');


% --------------------------------------------------------------------
function TRB_A5_Callback(hObject, eventdata, handles)
texto = sprintf ('Solos siltosos com pequena quantidade de material grosso e argila, rico em mica e diatomita (alta compressibilidade LL > 40%)');
msgbox(texto, 'TRB A.5');


% --------------------------------------------------------------------
function TRB_A6_Callback(hObject, eventdata, handles)
texto = sprintf ('Argilas siltosas medianamente plásticas com pouco ou nenhum material grosso (baixa compressibilidade).');
msgbox(texto, 'TRB A.6');


% --------------------------------------------------------------------
function TRB_A7_Callback(hObject, eventdata, handles)
% hObject    handle to TRB_A7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function TRB_A75_Callback(hObject, eventdata, handles)
texto = sprintf ('Argilas plásticas com presença de matéria orgânica (alta compressibilidade).\n\t\t IP ? LL - 30');
msgbox(texto, 'TRB A.7-5');


% --------------------------------------------------------------------
function TRB_A76_Callback(hObject, eventdata, handles)
texto = sprintf ('Argilas plásticas com presença de matéria orgânica (alta compressibilidade).\n\t\t IP > LL - 30');
msgbox(texto, 'TRB A.7-6');
