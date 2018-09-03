function varargout = AES_GUI(varargin)
% AES_GUI MATLAB code for AES_GUI.fig
%      AES_GUI, by itself, creates a new AES_GUI or raises the existing
%      singleton*.
%
%      H = AES_GUI returns the handle to a new AES_GUI or the handle to
%      the existing singleton*.
%
%      AES_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AES_GUI.M with the given input arguments.
%
%      AES_GUI('Property','Value',...) creates a new AES_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AES_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AES_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AES_GUI

% Last Modified by GUIDE v2.5 17-Jul-2017 19:46:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AES_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @AES_GUI_OutputFcn, ...
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


% --- Executes just before AES_GUI is made visible.
function AES_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AES_GUI (see VARARGIN)

% Choose default command line output for AES_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% DESIGN 
% ah = axes('unit', 'normalized', 'position', [0 0 1 1]);
% bg = imread('myszkowski.jpg'); imagesc(bg);
% set(ah,'handlevisibility','off','visible','off')

% UIWAIT makes AES_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AES_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function in_Callback(hObject, eventdata, handles)
% hObject    handle to in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of in as text
%        str2double(get(hObject,'String')) returns contents of in as a double


% --- Executes during object creation, after setting all properties.
function in_CreateFcn(hObject, eventdata, handles)
% hObject    handle to in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% Hint: get(hObject,'Value') returns toggle state of togglebutton1



function out_Callback(hObject, eventdata, handles)
% hObject    handle to key (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of key as text
%        str2double(get(hObject,'String')) returns contents of key as a double


% --- Executes during object creation, after setting all properties.
function out_CreateFcn(hObject, eventdata, handles)
% hObject    handle to key (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function key_Callback(hObject, eventdata, handles)
% hObject    handle to key (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of key as text
%        str2double(get(hObject,'String')) returns contents of key as a double


% --- Executes during object creation, after setting all properties.
function key_CreateFcn(hObject, eventdata, handles)
% hObject    handle to key (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in selection.
function selection_Callback(hObject, eventdata, handles)
% hObject    handle to selection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns selection contents as cell array
%        contents{get(hObject,'Value')} returns selected item from selection


% --- Executes during object creation, after setting all properties.
function selection_CreateFcn(hObject, eventdata, handles)
% hObject    handle to selection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plain = get(handles.in, 'string');
plain = abs(preprocessing(plain))
key = get(handles.key, 'string');
key = abs(padding(key));

[sBox, polyMat, rcon, leftShift] = getTable();
mac = macGeneration();
sBox = sBoxGenerator(sBox, mac);

roundkey = keyExpand(key, sBox, rcon);

[r, c] = size(plain);

all_plain = [];
all_encrypt = [];
all_char = [];
for i = 1:r
    all_plain = [all_plain, cipher2hex(plain(i,:))];
    encrypted = encryption(plain(i,:), roundkey, sBox, leftShift, polyMat);
    all_char = [all_char, char(reshape(encrypted, 1, 16))];
    encrypted_in_hex = cipher2hex(encrypted);
    all_encrypt = [all_encrypt, encrypted_in_hex];
end
all_encrypt
set(handles.inhex, 'string', all_plain);
set(handles.out, 'string', all_encrypt);
set(handles.char, 'string', all_char);




function inhex_Callback(hObject, eventdata, handles)
% hObject    handle to inhex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inhex as text
%        str2double(get(hObject,'String')) returns contents of inhex as a double


% --- Executes during object creation, after setting all properties.
function inhex_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inhex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on inhex and none of its controls.
function inhex_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to inhex (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on in and none of its controls.
function in_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to in (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



function char_Callback(hObject, eventdata, handles)
% hObject    handle to char (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of char as text
%        str2double(get(hObject,'String')) returns contents of char as a double


% --- Executes during object creation, after setting all properties.
function char_CreateFcn(hObject, eventdata, handles)
% hObject    handle to char (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of out as text
%        str2double(get(hObject,'String')) returns contents of out as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
