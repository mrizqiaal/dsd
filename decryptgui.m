function varargout = decryptgui(varargin)
% DECRYPTGUI MATLAB code for decryptgui.fig
%      DECRYPTGUI, by itself, creates a new DECRYPTGUI or raises the existing
%      singleton*.
%
%      H = DECRYPTGUI returns the handle to a new DECRYPTGUI or the handle to
%      the existing singleton*.
%
%      DECRYPTGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DECRYPTGUI.M with the given input arguments.
%
%      DECRYPTGUI('Property','Value',...) creates a new DECRYPTGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before decryptgui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to decryptgui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help decryptgui

% Last Modified by GUIDE v2.5 18-Jul-2017 20:30:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @decryptgui_OpeningFcn, ...
                   'gui_OutputFcn',  @decryptgui_OutputFcn, ...
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


% --- Executes just before decryptgui is made visible.
function decryptgui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to decryptgui (see VARARGIN)

% Choose default command line output for decryptgui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes decryptgui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = decryptgui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
str = get(handles.edit1, 'string');
[row col] = size(str);
% Mengubah str ke cell agar trailing space hilang dan support konkatenasi
outStr = [];
for i = 1 : row
   outStr = [outStr; {deblank(str(i,:))}];
end

str4Hash = outStr{1};
for i = 2 : row-3
    str4Hash = [str4Hash char(10) outStr{i}];
end

hashfunc = sha256(str4Hash);

lenStr = length(outStr);
hash = outStr(lenStr-1);
all_encrypt = hash{1};

key = get(handles.edit5, 'string');
key = abs(padding(key));
[sBox, polyMat, rcon, leftShift] = getInvTable();
mac = mac2Array(get(handles.edit2, 'string'));
sBox = sBoxGenerator(sBox, mac);

roundkey = keyExpand(key, sBox, rcon);

sBox = sBoxInverseGenerator(sBox);

if(mod(length(all_encrypt), 48) == 47)
    all_encrypt = [all_encrypt, ' ']; 
end

r = length(all_encrypt)/48;
all_result = [];
all_char = [];

for i = 1:r
    cipher = string2cipher(all_encrypt(1+(48*(i - 1)):48+(48*(i-1))));
    decrypted = decryption(cipher, roundkey, sBox, leftShift, polyMat);
    all_result = [all_result, cipher2hex(decrypted)]; 
    all_char = [all_char, char(reshape(decrypted, 16, 1)')];
end

indexes = strfind(all_char,sprintf('\n'));
for i = 1:length(indexes)
    all_char(indexes(i)) = ' ';
end
if all_char == hashfunc
    verif = 'cocok'
else
    verif = 'tidak cocok'
end
all = ['hash function = ' hashfunc char(10) char(10) 'hash = ' all_char char(10) char(10) verif]
set(handles.edit4, 'string', all);

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
