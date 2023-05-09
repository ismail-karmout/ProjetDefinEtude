function varargout = DetectionPointInteret(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DetectionPointInteret_OpeningFcn, ...
                   'gui_OutputFcn',  @DetectionPointInteret_OutputFcn, ...
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



% --- Executes just before DetectionPointInteret is made visible.
function DetectionPointInteret_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;


guidata(hObject, handles);


function varargout = DetectionPointInteret_OutputFcn(hObject, eventdata, handles) 


%show image of FSTE
%varargout{1} = handles.output;
%myImage = imread('fste.jpg');
%axes(handles.axes8);
%imshow(myImage);

%show logo of APPLICATION EDGE IT
%varargout{1} = handles.output;
%logoImage = imread('logoSH.jpg');
%axes(handles.axesLOGO);
%imshow(logoImage);


% --- Executes on button press in SUSAN
function pb_susan_Callback(hObject, eventdata, handles)
set(handles.axes5,'visible','off');
set(handles.axes2,'visible','on');
set(handles.axes3,'visible','on');
set(handles.uipanel1,'visible','on');
set(handles.savebtn,'enable','on');
set(handles.save_dip,'visible','off');

   S = 10;
    R = 3;
    global filename pathname;
    img=imread(strcat(pathname,filename));
   % img=getimage(handles.axes1)
    handles.EDG = points_interet(img,S, R);
    axes(handles.axes2);
    imshow(handles.EDG);
    axes(handles.axes3);
    % affichage en 3D
    surf(handles.EDG,'FaceColor','texturemap','EdgeColor','none','CDataMapping','scaled');
    view(135,80);
    
 
    


% --- Executes on button press in HARRIS.
function pb_harris_Callback(hObject, eventdata, handles)


%global filename pathname;
img= handles.im ;
%axes(handles.axes1);
%imshow(img);
axes(handles.axes5);
%img = imread('rd.jpg'); 
if length(size(img))>2
    img = rgb2gray(img);
end 

fx = [-1 0 1;-1 0 1;-1 0 1];
Ix = filter2(fx,img);

fy = [1 1 1;0 0 0;-1 -1 -1];
Iy = filter2(fy,img); 
Ix2 = Ix.^2;
Iy2 = Iy.^2;
Ixy = Ix.*Iy;
clear Ix;
clear Iy;

h= fspecial('gaussian',[7 7],2); 
Ix2 = filter2(h,Ix2);
Iy2 = filter2(h,Iy2);
Ixy = filter2(h,Ixy);
height = size(img,1);
width = size(img,2);
result = zeros(height,width); 
R = zeros(height,width);
Rmax = 0; 
for i = 1:height
    for j = 1:width
        M = [Ix2(i,j) Ixy(i,j);Ixy(i,j) Iy2(i,j)]; 
        R(i,j) = det(M)-0.01*(trace(M))^2;
        if R(i,j) > Rmax
            Rmax = R(i,j);
        end;
    end;
end;
cnt = 0;
for i = 2:height-1
for j = 2:width-1
if R(i,j) > 0.1*Rmax && R(i,j) > R(i-1,j-1) && R(i,j) > R(i-1,j) && R(i,j) > R(i-1,j+1) && R(i,j) > R(i,j-1) && R(i,j) > R(i,j+1) && R(i,j) > R(i+1,j-1) && R(i,j) > R(i+1,j) && R(i,j) > R(i+1,j+1)
result(i,j) = 1;
cnt = cnt+1;
end;
end;
end;
[posc, posr] = find(result == 1);
cnt ;
imshow(img);
hold on;
plot(posr,posc,'r.');

set(handles.axes2,'visible','off');
set(handles.axes3,'visible','off');
set(handles.axes5,'visible','on');
set(handles.save_dip,'visible','on');

set(handles.uipanel1,'visible','off');
%handles.imgg=harris_fcn(handles.imggg);
%axes(handles.axes5);
%imshow(img);



    
% --- Executes on button press in UPLOAD
function pb_upload_Callback(hObject, eventdata, handles)

%global filename pathname;
%set(handles.axes1,'visible','on')
%set(handles.uipanel2,'visible','off')
%set(handles.pb_susan,'enable','on')
%set(handles.pb_harris,'enable','on')
%set(handles.cltag,'enable','on')
%[filename,pathname]=uigetfile('*.*','home/root-ma/Desktop');
%handles.img=imread(strcat(pathname,filename));
%guidata(hObject,handles);
%axes(handles.axes1);
%imshow(handles.img);
[FileName,PathName] = uigetfile({'*.*'});
handles.fullPath = [PathName,FileName];
%Lecture de l'image
handles.im = imread(handles.fullPath);
axes(handles.axes1); cla; imshow(handles.im);
guidata(hObject,handles);


% --- Executes on button press in CLEAR
function cltag_Callback(hObject, eventdata, handles)

delete(allchild(handles.axes1));
delete(allchild(handles.axes3));
delete(allchild(handles.axes2));
delete(allchild(handles.axes5));
set(handles.uipanel1,'visible','off');
set(handles.axes5,'visible','off');
set(handles.axes1,'visible','off');
%set(handles.pb_susan,'enable','off');
%set(handles.pb_harris,'enable','off');
set(handles.cltag,'enable','off');
set(handles.uipanel2,'visible','on');
set(handles.savebtn,'enable','on');
set(handles.save_dip,'visible','off');

% --- Executes on button press in SAVE
function savebtn_Callback(hObject, eventdata, handles)


[file,path]=uiputfile({'*.jpg','JPG'},'Save Image As');

    m=getframe(handles.axes3);

[y,map]=frame2im(m);

 
imwrite(y,fullfile(path, file),'jpg');


% --- Executes on button press in save2.
function save_dip_Callback(hObject, eventdata, handles)


[file,path]=uiputfile({'*.jpg','JPG'},'Save Image As');

    m=getframe(handles.axes5);

[y,map]=frame2im(m);

 
imwrite(y,fullfile(path, file),'jpg');


% --- Executes during object creation, after setting all properties.
function axesLOGO_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axesLOGO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axesLOGO


% --- Executes during object deletion, before destroying properties.
function axesLOGO_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to axesLOGO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object deletion, before destroying properties.
function axes8_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to axes8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton10.
open(MenuInterface);

% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all ;
