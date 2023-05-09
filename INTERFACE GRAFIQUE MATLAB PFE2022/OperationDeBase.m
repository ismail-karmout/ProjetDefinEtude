function varargout = OperationDeBase(varargin)
% OPERATIONDEBASE MATLAB code for OperationDeBase.fig
%      OPERATIONDEBASE, by itself, creates a new OPERATIONDEBASE or raises the existing
%      singleton*.
%
%      H = OPERATIONDEBASE returns the handle to a new OPERATIONDEBASE or the handle to
%      the existing singleton*.
%
%      OPERATIONDEBASE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OPERATIONDEBASE.M with the given input arguments.
%
%      OPERATIONDEBASE('Property','Value',...) creates a new OPERATIONDEBASE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before OperationDeBase_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to OperationDeBase_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help OperationDeBase

% Last Modified by GUIDE v2.5 03-Sep-2020 18:33:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @OperationDeBase_OpeningFcn, ...
                   'gui_OutputFcn',  @OperationDeBase_OutputFcn, ...
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

% --- Executes just before OperationDeBase is made visible.
function OperationDeBase_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to OperationDeBase (see VARARGIN)

% Choose default command line output for OperationDeBase
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes OperationDeBase wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = OperationDeBase_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Importer l'image
[FileName,PathName] = uigetfile({'*.*'});
handles.fullPath = [PathName,FileName];

%Lecture de l'image
handles.im = imread(handles.fullPath);
axes(handles.axes4); cla; imshow(handles.im);

%Information générale sur limage
info = imfinfo(handles.fullPath);
set(handles.IMsize,'String',sprintf('Dimension : %d x %d', info.Width, info.Height));
set(handles.IMpath, 'String', handles.fullPath);
set(handles.IMoctet,'String', sprintf('%d Octet', info.FileSize) ); 
set(handles.IMformat,'String', info.Format); 

guidata(hObject,handles);






% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Convertir en niveaux de gris
handles.var = 1;
handles.gr = rgb2gray(handles.im);
axes(handles.axes10); cla; imshow(handles.gr);
guidata(hObject,handles);

% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open(MenuInterface);

% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[file,path]= uiputfile('*.jpg','Save Image as');
save=[path,file]; 
if(handles.var==1)
imwrite(handles.gr,save,'jpg');
else
imwrite(handles.bin,save,'jpg');
end

% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[file,path]= uiputfile('*.jpg','Save Image as');
save=[path,file]; 

switch handles.var1
   case 1
      imwrite(handles.cont,save,'jpg');
   case 2
      imwrite(handles.li,save,'jpg');
   case 3
      imwrite(handles.rot,save,'jpg');
end



% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.var1=1;
x=get(hObject,'Value');
handles.cont=handles.im;
handles.cont=handles.cont.*x;
axes(handles.axes9); cla; imshow(handles.cont) 
set(handles.IMcontrast,'String',num2str(x));
guidata(hObject, handles); 



% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.var1=2;
x=get(hObject,'Value');
handles.li=handles.im;
handles.li=handles.li+x;
axes(handles.axes9); cla; imshow(handles.li)
set(handles.IMlight,'String',num2str(x));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

%Rotation
handles.var1=3;
x = get(hObject,'Value');
handles.rot=imrotate(handles.im,x);
axes(handles.axes9); cla; imshow(handles.rot);
set(handles.editROT,'String',num2str(x));
guidata(hObject, handles); 

% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Image binaire
handles.var = 0;
level = graythresh(handles.im); 
handles.bin = im2bw(handles.im,level);

% ig=rgb2gray(handles.im);
% handles.bin = imbinarize(ig);
% handles.bin  = imbinarize(ig,'adaptive'); 
% handles.bin  = imbinarize(ig,'global');

axes(handles.axes10); cla; imshow(handles.bin);
guidata(hObject,handles);



function IMlight_Callback(hObject, eventdata, handles)
% hObject    handle to IMlight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of IMlight as text
%        str2double(get(hObject,'String')) returns contents of IMlight as a double


% --- Executes during object creation, after setting all properties.
function IMlight_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IMlight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editROT_Callback(hObject, eventdata, handles)
% hObject    handle to editROT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editROT as text
%        str2double(get(hObject,'String')) returns contents of editROT as a double


% --- Executes during object creation, after setting all properties.
function editROT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editROT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton30.
function pushbutton30_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open(OperationBaseSuivant);


function IMpath_Callback(hObject, eventdata, handles)
% hObject    handle to IMpath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of IMpath as text
%        str2double(get(hObject,'String')) returns contents of IMpath as a double


% --- Executes during object creation, after setting all properties.
function IMpath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IMpath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function IMsize_Callback(hObject, eventdata, handles)
% hObject    handle to IMsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of IMsize as text
%        str2double(get(hObject,'String')) returns contents of IMsize as a double


% --- Executes during object creation, after setting all properties.
function IMsize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IMsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function IMoctet_Callback(hObject, eventdata, handles)
% hObject    handle to IMoctet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of IMoctet as text
%        str2double(get(hObject,'String')) returns contents of IMoctet as a double


% --- Executes during object creation, after setting all properties.
function IMoctet_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IMoctet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function IMformat_Callback(hObject, eventdata, handles)
% hObject    handle to IMformat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of IMformat as text
%        str2double(get(hObject,'String')) returns contents of IMformat as a double


% --- Executes during object creation, after setting all properties.
function IMformat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IMformat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function IMcontrast_Callback(hObject, eventdata, handles)
% hObject    handle to IMcontrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of IMcontrast as text
%        str2double(get(hObject,'String')) returns contents of IMcontrast as a double


% --- Executes during object creation, after setting all properties.
function IMcontrast_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IMcontrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
