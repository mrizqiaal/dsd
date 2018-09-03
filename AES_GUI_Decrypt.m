function varargout = AES_GUI_Decrypt(varargin)
% AES_GUI_Decrypt MATLAB code for AES_GUI_Decrypt.fig
%      AES_GUI_Decrypt, by itself, creates a new AES_GUI_Decrypt or raises the existing
%      singleton*.
%
%      H = AES_GUI_Decrypt returns the handle to a new AES_GUI_Decrypt or the handle to
%      the existing singleton*.
%
%      AES_GUI_Decrypt('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AES_GUI_Decrypt.M with the given input arguments.
%
%      AES_GUI_Decrypt('Property','Value',...) creates a new AES_GUI_Decrypt or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AES_GUI_Decrypt_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AES_GUI_Decrypt_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AES_GUI_Decrypt

% Last Modified by GUIDE v2.5 17-Jul-2017 20:24:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AES_GUI_Decrypt_OpeningFcn, ...
                   'gui_OutputFcn',  @AES_GUI_Decrypt_OutputFcn, ...
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


% --- Executes just before AES_GUI_Decrypt is made visible.
function AES_GUI_Decrypt_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AES_GUI_Decrypt (see VARARGIN)

% Choose default command line output for AES_GUI_Decrypt
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% DESIGN 
% ah = axes('unit', 'normalized', 'position', [0 0 1 1]);
% bg = imread('myszkowski.jpg'); imagesc(bg);
% set(ah,'handlevisibility','off','visible','off')

% UIWAIT makes AES_GUI_Decrypt wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AES_GUI_Decrypt_OutputFcn(hObject, eventdata, handles) 
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



function phex_Callback(hObject, eventdata, handles)
% hObject    handle to phex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of phex as text
%        str2double(get(hObject,'String')) returns contents of phex as a double


% --- Executes during object creation, after setting all properties.
function phex_CreateFcn(hObject, eventdata, handles)
% hObject    handle to phex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function key_Callback(hObject, eventdata, handles)
% hObject    handle to phex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of phex as text
%        str2double(get(hObject,'String')) returns contents of phex as a double


% --- Executes during object creation, after setting all properties.
function key_CreateFcn(hObject, eventdata, handles)
% hObject    handle to phex (see GCBO)
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

all_encrypt = get(handles.in, 'string');
key = get(handles.key, 'string');
key = abs(padding(key));

[sBox, polyMat, rcon, leftShift] = getInvTable();

switch get(handles.mac,'Value')   
    case 1
      mac = macGeneration();
    case 2
      mac = mac2Array('C8:2A:14:37:9D:21');
    otherwise
 end  

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

set(handles.phex, 'string', all_result);
set(handles.out, 'string', all_char);




function chex_Callback(hObject, eventdata, handles)
% hObject    handle to chex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of chex as text
%        str2double(get(hObject,'String')) returns contents of chex as a double


% --- Executes during object creation, after setting all properties.
function chex_CreateFcn(hObject, eventdata, handles)
% hObject    handle to chex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on phex press with focus on chex and none of its controls.
function chex_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to chex (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	phex: name of the phex that was pressed, in lower case
%	Character: character interpretation of the phex(s) that was pressed
%	Modifier: name(s) of the modifier phex(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on phex press with focus on in and none of its controls.
function in_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to in (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	phex: name of the phex that was pressed, in lower case
%	Character: character interpretation of the phex(s) that was pressed
%	Modifier: name(s) of the modifier phex(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



function out_Callback(hObject, eventdata, handles)
% hObject    handle to out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of out as text
%        str2double(get(hObject,'String')) returns contents of out as a double


% --- Executes during object creation, after setting all properties.
function out_CreateFcn(hObject, eventdata, handles)
% hObject    handle to out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in mac.
function mac_Callback(hObject, eventdata, handles)
% hObject    handle to mac (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns mac contents as cell array
%        contents{get(hObject,'Value')} returns selected item from mac


% --- Executes during object creation, after setting all properties.
function mac_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mac (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
