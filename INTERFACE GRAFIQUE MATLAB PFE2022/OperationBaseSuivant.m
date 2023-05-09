function varargout = OperationBaseSuivant(varargin)
% OPERATIONBASESUIVANT MATLAB code for OperationBaseSuivant.fig
%      OPERATIONBASESUIVANT, by itself, creates a new OPERATIONBASESUIVANT or raises the existing
%      singleton*.
%
%      H = OPERATIONBASESUIVANT returns the handle to a new OPERATIONBASESUIVANT or the handle to
%      the existing singleton*.
%
%      OPERATIONBASESUIVANT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OPERATIONBASESUIVANT.M with the given input arguments.
%
%      OPERATIONBASESUIVANT('Property','Value',...) creates a new OPERATIONBASESUIVANT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before OperationBaseSuivant_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to OperationBaseSuivant_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help OperationBaseSuivant

% Last Modified by GUIDE v2.5 04-Sep-2020 12:05:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @OperationBaseSuivant_OpeningFcn, ...
                   'gui_OutputFcn',  @OperationBaseSuivant_OutputFcn, ...
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


% --- Executes just before OperationBaseSuivant is made visible.
function OperationBaseSuivant_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to OperationBaseSuivant (see VARARGIN)

% Choose default command line output for OperationBaseSuivant
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes OperationBaseSuivant wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = OperationBaseSuivant_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in Lnoise.
function Lnoise_Callback(hObject, eventdata, handles)
% hObject    handle to Lnoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Lnoise contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Lnoise

contents=get(hObject,'Value');
switch contents

    case 1  %gaussian
        handles.s = 1;
        handles.gau = imnoise(handles.im,'gaussian');
        axes(handles.axes3); cla; imshow(handles.gau);
        guidata(hObject,handles);
        
    case 2  %poisson
        handles.s = 2;
        handles.poi = imnoise(handles.im,'poisson');
        axes(handles.axes3); cla; imshow(handles.poi);
        guidata(hObject,handles);
 
    case 3  %salt & pepper
        handles.s = 3;
        handles.sal = imnoise(handles.im,'salt & pepper',0.02);
        axes(handles.axes3); cla; imshow(handles.sal);
        guidata(hObject,handles);
        
    case 4 % speckle 
        handles.s = 4;
        handles.spe = imnoise(handles.im,'speckle',0.04);
        axes(handles.axes3); cla; imshow(handles.spe);
        guidata(hObject,handles);
end


% --- Executes during object creation, after setting all properties.
function Lnoise_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Lnoise (see GCBO)
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

%Importer l'image
[FileName,PathName] = uigetfile({'*.*'});
handles.fullPath = [PathName,FileName];
%Lecture de l'image
handles.im = imread(handles.fullPath);
axes(handles.axes1); cla; imshow(handles.im);
guidata(hObject,handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2); cla;
R = handles.im(:,:,1);
G = handles.im(:,:,2);
B = handles.im(:,:,3);
[yRed,x] = imhist(R);
[yGreen,x] = imhist(G);
[yBlue,x] = imhist(B);
plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue');
guidata(hObject, handles);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[file,path]= uiputfile('*.jpg','Save Image as');
save=[path,file]; 

switch handles.s
   case 1
      imwrite(handles.gau,save,'jpg');
   case 2
      imwrite(handles.poi,save,'jpg');
   case 3
      imwrite(handles.sal,save,'jpg');
   case 4
      imwrite(handles.spe,save,'jpg');
end

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open(OperationDeBase);
% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.axes2); cla;
handles.gray = rgb2gray(handles.im);
Hist=imhist(handles.gray);
plot(Hist);
guidata(hObject, handles); 

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

R = handles.im(:,:,1);
G = handles.im(:,:,2);
B = handles.im(:,:,3);
[yRed,x] = imhist(R);
[yGreen,x] = imhist(G);
[yBlue,x] = imhist(B);
handles.gray = rgb2gray(handles.im);
Hist=imhist(handles.gray);
figure;
subplot(1, 2, 1); 
plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue');
title('Histogramme image en couleur'); 
subplot(1, 2, 2); 
plot(Hist);
title('Histogramme image en niveux de gris');
guidata(hObject, handles);

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.gau = imnoise(handles.im,'gaussian');
handles.poi = imnoise(handles.im,'poisson');
handles.sal = imnoise(handles.im,'salt & pepper',0.02);
handles.spe = imnoise(handles.im,'speckle',0.04);

figure;
subplot(2, 2, 1); imshow(handles.gau);  title('Gaussian'); 
subplot(2, 2, 2); imshow(handles.poi); title('Poisson');
subplot(2, 2, 3); imshow(handles.sal); title('Salt & pepper');
subplot(2, 2, 4); imshow(handles.spe); title('Speckle');
guidata(hObject, handles);
