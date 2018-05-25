function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 20-May-2018 02:00:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
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

[filename,filepath]=uigetfile({'*.*';'*.jpg';'*.bmp';'*.png'},'Search image to be displayed');
fullname=[filepath filename];

handles.filepath=filepath;

handles.imageFile=imread(fullname);
axes(handles.axes1)
imshow(handles.imageFile);

handles.orimage=handles.imageFile;

%%grey image
handles.imageFile=rgb2gray(handles.imageFile);
Gimage=handles.imageFile;
handles.greyImage=handles.imageFile;

axes(handles.axes2)
imshow(handles.imageFile);

handles.imageFile=im2bw(handles.imageFile);
handles.blackandwhite=handles.imageFile;
axes(handles.axes3)
imshow(handles.imageFile);
guidata(hObject,handles)


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

    editcontrast=get(hObject,'value');

    set(handles.edit4,'string',num2str(editcontrast));


    %global handles.imageFile;
    J = imadjust(handles.orimage,[editcontrast 1-editcontrast],[]);
    I=rgb2gray(J);
    O=im2bw(I);
    axes(handles.axes2)
    imshow(J);
    axes(handles.axes3)
    imshow(I);
    axes(handles.axes1)
    imshow(O);
    handles.finalBitmap=O;
    guidata(hObject,handles);

  






% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)


    editbrightness=get(hObject,'value');
    set(handles.edit7,'string',num2str(editbrightness));

    %J = imadjust(handles.orimage,[editcontrast 1-editcontrast],[]);
    %global handles.imageFile;
    %deviatia standard
    J=handles.orimage;
    J=J+editbrightness;

    I=rgb2gray(J);
    O=im2bw(I);
    axes(handles.axes2)
    imshow(J);
    axes(handles.axes3)
    imshow(I);
    axes(handles.axes1)
    imshow(O);
    handles.finalBitmap=O;
    guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
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



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
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



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)


    set(handles.edit27, 'String', 'Done');
    guidata(hObject, handles);
    
    nrShares = get(handles.edit9,'string');
    nrShares=str2num(nrShares);
    
    mExpansion = get(handles.text3,'string');
    mExpansion=str2num(mExpansion);
              % creare matrici C pentru permutari random etc.
    %Gimage=handles.ggg; %%reprezent the grey image  
    BitmapImage=handles.blackandwhite; %reprezent bitmap image
    GreyImage = handles.greyImage; % represent the grey image
    
    [widthg heightg] = size(handles.greyImage);
    [width, height]=size(BitmapImage);
     
    fact=factorial(nrShares);
    for i=1:1:nrShares
        v(i)=i;
    end    
    P=perms(v);
    
    
    MatB=zeros(width*3,height*3);
    %disp(handles.greyImage);
    for i=1:1:width
       for j=1:1:height
          b=de2bi(handles.greyImage(i,j),9);
          pixel=vec2mat(b,3);
          MatB(i*3-2:i*3,j*3-2:j*3)=pixel;
       end
        
    end
    
    width=width*3;
    height=height*3;
    
    Sh0=zeros(nrShares,mExpansion*width);
    Sh1=zeros(nrShares,mExpansion*width);

    %BitmapImage(1,1)=0;
    %BitmapImage(1,2)=1;
    
    for i=1:1:width
       for j=1:1:height
           counter=j*2-1;
           if(MatB(i,j)==0)
               r = randi([1 mExpansion],1,1);
               for x=1:1:nrShares
                   for y=j*mExpansion-mExpansion+1:1:mExpansion*j
                       if(r==mod(y,mExpansion)+1)
                           SH(i,y,x)=1;
                       else
                           SH(i,y,x)=0;
                       end
                   end
               end
           end
           if(MatB(i,j)==1)
               
               r = randi([1 fact],1,1);
               for x=1:1:nrShares
                   for y=j*mExpansion-mExpansion+1:1:mExpansion*j
                       if(P(r,x)==mod(y,mExpansion)+1)
                           SH(i,y,x)=1;
                       else
                           SH(i,y,x)=0;
                       end
                   end
               end
               
           end
       end
    end
    
    
    
    objout = bitxor(SH(:,:,1),SH(:,:,2));
    
    %figure
    %for i=1:1:nrShares
    %   subplot(nrShares,1,i)
    %   imshow(SH(:,:,i));
    %end
    
     for i=3:1:nrShares
         objout = bitxor(objout,SH(:,:,i));
     end
    
    axes(handles.axes5)
    imshow(SH(:,:,1));
    axes(handles.axes6)
    imshow(SH(:,:,2));
    
    
    
    counter=1;
    for i=1:1:width/3
       for j=1:1:height/3
          pixelmat=objout(i*3-2:i*3,j*3-2:j*3);
          pixelmat=pixelmat';
          vec=reshape(pixelmat,1,[]);
          disp(vec);
          pixelGray=bi2de(vec);
          if (pixelGray >=256)
              pixelGray=pixelGray - 256;
          end
          NewGray(counter)=pixelGray;
          counter=counter+1;
       end
        
    end
    
    NewGray=vec2mat(NewGray,width/3);
    axes(handles.axes13)
    imshow(objout);
    
    
    %mat=[1 1 1; 2 2 2;3 3 3];
    %mat=mat';
    %vec=reshape(mat,1,[]);
    %disp(vec);
    
    
%     Sh2=SH(:,:,1);
%     Sh3=SH(:,:,2);
%     figure
%     subplot(2,1,1)
%     imshow(Sh2);
%     subplot(2,1,2)
%     imshow(Sh3);
%     
%     objout = bitxor(Sh2,Sh3)
%     figure
%     subplot(2,1,1)
%     imshow(objout);

    
%     P(1,1,1)=1;
%     P(1,1,2)=2;
%     P(1,1,3)=3;
%     P(1,2,1)=1;
%     P(1,2,2)=2;
%     P(1,2,3)=3;
%     
%     
%     P(2,1,1)=4;
%     P(2,1,2)=5;
%     P(2,1,3)=6;
%     P(2,2,1)=7;
%     P(2,2,2)=8;
%     P(2,2,3)=9;
%     
%     disp(P(1,:,:));
    %nrShares=str2num(nrShares);
    %matrix=encode(Gimage,nrShares);

    %S0=matrix(:,1:nrShares);
    %S1=matrix(:,nrShares+1:nrShares*2);
  
    %disp(S0(:,:));
    %disp(S1(:,:));
    %disp(Gimage); 
    
    
    handles.sh1=SH(:,:,1);
    handles.sh2=SH(:,:,2);
    guidata(hObject, handles);
    



function edit22_Callback(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit22 as text
%        str2double(get(hObject,'String')) returns contents of edit22 as a double


% --- Executes during object creation, after setting all properties.
function edit22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit23_Callback(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit23 as text
%        str2double(get(hObject,'String')) returns contents of edit23 as a double


% --- Executes during object creation, after setting all properties.
function edit23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit24_Callback(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit24 as text
%        str2double(get(hObject,'String')) returns contents of edit24 as a double


% --- Executes during object creation, after setting all properties.
function edit24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit25_Callback(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit25 as text
%        str2double(get(hObject,'String')) returns contents of edit25 as a double


% --- Executes during object creation, after setting all properties.
function edit25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit26_Callback(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit26 as text
%        str2double(get(hObject,'String')) returns contents of edit26 as a double


% --- Executes during object creation, after setting all properties.
function edit26_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit27_Callback(hObject, eventdata, handles)
% hObject    handle to edit27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit27 as text
%        str2double(get(hObject,'String')) returns contents of edit27 as a double


% --- Executes during object creation, after setting all properties.
function edit27_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.

%%save shares to folder
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imwrite(handles.sh1,[handles.filepath 'sh1.bmp']);
imwrite(handles.sh2,[handles.filepath 'sh2.bmp']);
set(handles.edit27, 'String', 'Shares are saved');
guidata(hObject, handles);
imwrite(handles.sh3,[handles.filepath 'sh3.bmp']);
imwrite(handles.sh4,[handles.filepath 'sh4.bmp']);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[folder] = uigetdir;

disp(folder);
handles.sh1=imread([folder '\sh1.bmp']);
axes(handles.axes5)
imshow(handles.sh1);
handles.sh2=imread([folder '\sh2.bmp']);
axes(handles.axes6)
imshow(handles.sh2);
objout = bitxor(handles.sh1,handles.sh2);
 axes(handles.axes13)
 imshow(objout);
handles.sh3=imread([folder '\sh3.bmp']);
axes(handles.axes7)
imshow(handles.sh3);
objout = bitxor(objout,handles.sh3);
 axes(handles.axes13)
 imshow(objout);
handles.sh4=imread([folder '\sh4.bmp']);
axes(handles.axes12)
imshow(handles.sh4);
objout = bitxor(objout,handles.sh4);
 axes(handles.axes13)
 imshow(objout);


guidata(hObject, handles);



function edit28_Callback(hObject, eventdata, handles)
% hObject    handle to edit28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit28 as text
%        str2double(get(hObject,'String')) returns contents of edit28 as a double


% --- Executes during object creation, after setting all properties.
function edit28_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton9.  


%%%%encode for 3 shares and 3 m expansion
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit27, 'String', 'Done');
    guidata(hObject, handles);
    
    nrShares = get(handles.text9,'string');
    nrShares=str2num(nrShares);
    disp(nrShares);
    mExpansion = get(handles.text8,'string');
    mExpansion=str2num(mExpansion);
              % creare matrici C pentru permutari random etc.
    %Gimage=handles.ggg; %%reprezent the grey image  
    BitmapImage=handles.blackandwhite; %reprezent bitmap image
    
    [width, height]=size(BitmapImage);
    
    fact=factorial(nrShares);
    for i=1:1:nrShares
        v(i)=i;
    end    
    P=perms(v);
    
    C1=[1 0;0 1];
    
    Sh0=zeros(nrShares,mExpansion*width);
    Sh1=zeros(nrShares,mExpansion*width);

    %BitmapImage(1,1)=0;
    %BitmapImage(1,2)=1;
    
    for i=1:1:width
       for j=1:1:height
           counter=j*2-1;
           if(BitmapImage(i,j)==0)
               r = randi([1 mExpansion],1,1);
               for x=1:1:nrShares
                   for y=j*mExpansion-mExpansion+1:1:mExpansion*j
                       if(r==mod(y,mExpansion)+1)
                           SH(i,y,x)=1;
                       else
                           SH(i,y,x)=0;
                       end
                   end
               end
           end
           if(BitmapImage(i,j)==1)
               
               r = randi([1 fact],1,1);
               for x=1:1:nrShares
                   for y=j*mExpansion-mExpansion+1:1:mExpansion*j
                       if(P(r,x)==mod(y,mExpansion)+1)
                           SH(i,y,x)=1;
                       else
                           SH(i,y,x)=0;
                       end
                   end
               end
               
           end
           
           
           
           %counter=j*2-1;
%            if(BitmapImage(i,j)==0)
%               randNumber = floor(1.9*rand(1)); 
%               if(randNumber==0)
%                   Sh0(i,counter)    =C0(1,1);
%                   Sh0(i,counter+1)  =C0(1,2);
%                   Sh1(i,counter)    =C0(2,1);
%                   Sh1(i,counter+1)  =C0(2,2);
%               end
%               if(randNumber==1)
%                   Sh0(i,counter)    =C0(1,2);
%                   Sh0(i,counter+1)  =C0(1,1);
%                   Sh1(i,counter)    =C0(2,2);
%                   Sh1(i,counter+1)  =C0(2,1);
%                   
%               end
%               
%            end
%            if(BitmapImage(i,j)==1)
%               randNumber = floor(1.9*rand(1)); 
%               if(randNumber==0)
%                   Sh0(i,counter)    =C1(1,1);
%                   Sh0(i,counter+1)  =C1(1,2);
%                   Sh1(i,counter)    =C1(2,1);
%                   Sh1(i,counter+1)  =C1(2,2);
%               end
%               if(randNumber==1)
%                   Sh0(i,counter)    =C1(1,2);
%                   Sh0(i,counter+1)  =C1(1,1);
%                   Sh1(i,counter)    =C1(2,2);
%                   Sh1(i,counter+1)  =C1(2,1);
%                   
%               end
%            end
       end
    end
    
    
    
    objout = bitxor(SH(:,:,1),SH(:,:,2));
    %figure
    %for i=1:1:nrShares
    %   subplot(nrShares,1,i)
    %   imshow(SH(:,:,i));
    %end
    
     for i=3:1:nrShares
         objout = bitxor(objout,SH(:,:,i));
     end
    
    axes(handles.axes5)
    imshow(SH(:,:,1));
    axes(handles.axes6)
    imshow(SH(:,:,2));
    axes(handles.axes7)
    imshow(SH(:,:,3));
    
    axes(handles.axes13)
    imshow(objout);
%     Sh2=SH(:,:,1);
%     Sh3=SH(:,:,2);
%     figure
%     subplot(2,1,1)
%     imshow(Sh2);
%     subplot(2,1,2)
%     imshow(Sh3);
%     
%     objout = bitxor(Sh2,Sh3)
%     figure
%     subplot(2,1,1)
%     imshow(objout);

    
%     P(1,1,1)=1;
%     P(1,1,2)=2;
%     P(1,1,3)=3;
%     P(1,2,1)=1;
%     P(1,2,2)=2;
%     P(1,2,3)=3;
%     
%     
%     P(2,1,1)=4;
%     P(2,1,2)=5;
%     P(2,1,3)=6;
%     P(2,2,1)=7;
%     P(2,2,2)=8;
%     P(2,2,3)=9;
%     
%     disp(P(1,:,:));
    %nrShares=str2num(nrShares);
    %matrix=encode(Gimage,nrShares);

    %S0=matrix(:,1:nrShares);
    %S1=matrix(:,nrShares+1:nrShares*2);
  
    %disp(S0(:,:));
    %disp(S1(:,:));
    %disp(Gimage); 
    
    
    handles.sh1=SH(:,:,1);
    handles.sh2=SH(:,:,2);
    handles.sh3=SH(:,:,3);
    guidata(hObject, handles);
    



function edit29_Callback(hObject, eventdata, handles)
% hObject    handle to edit29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit29 as text
%        str2double(get(hObject,'String')) returns contents of edit29 as a double


% --- Executes during object creation, after setting all properties.
function edit29_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit30_Callback(hObject, eventdata, handles)
% hObject    handle to edit30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit30 as text
%        str2double(get(hObject,'String')) returns contents of edit30 as a double


% --- Executes during object creation, after setting all properties.
function edit30_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton10.

%%encode for 4 shares and 4 mExpansions
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    set(handles.edit27, 'String', 'Done');
    guidata(hObject, handles);
    
    nrShares = get(handles.text11,'string');
    nrShares=str2num(nrShares);
    disp(nrShares);
    mExpansion = get(handles.text10,'string');
    mExpansion=str2num(mExpansion);
              % creare matrici C pentru permutari random etc.
    %Gimage=handles.ggg; %%reprezent the grey image  
    BitmapImage=handles.blackandwhite; %reprezent bitmap image
    
    [width, height]=size(BitmapImage);
    
    fact=factorial(nrShares);
    for i=1:1:nrShares
        v(i)=i;
    end    
    P=perms(v);
    
    C1=[1 0;0 1];
    
    Sh0=zeros(nrShares,mExpansion*width);
    Sh1=zeros(nrShares,mExpansion*width);

    %BitmapImage(1,1)=0;
    %BitmapImage(1,2)=1;
    
    for i=1:1:width
       for j=1:1:height
           counter=j*2-1;
           if(BitmapImage(i,j)==0)
               r = randi([1 mExpansion],1,1);
               for x=1:1:nrShares
                   for y=j*mExpansion-mExpansion+1:1:mExpansion*j
                       if(r==mod(y,mExpansion)+1)
                           SH(i,y,x)=1;
                       else
                           SH(i,y,x)=0;
                       end
                   end
               end
           end
           if(BitmapImage(i,j)==1)
               
               r = randi([1 fact],1,1);
               for x=1:1:nrShares
                   for y=j*mExpansion-mExpansion+1:1:mExpansion*j
                       if(P(r,x)==mod(y,mExpansion)+1)
                           SH(i,y,x)=1;
                       else
                           SH(i,y,x)=0;
                       end
                   end
               end
               
           end
           
           
           
           %counter=j*2-1;
%            if(BitmapImage(i,j)==0)
%               randNumber = floor(1.9*rand(1)); 
%               if(randNumber==0)
%                   Sh0(i,counter)    =C0(1,1);
%                   Sh0(i,counter+1)  =C0(1,2);
%                   Sh1(i,counter)    =C0(2,1);
%                   Sh1(i,counter+1)  =C0(2,2);
%               end
%               if(randNumber==1)
%                   Sh0(i,counter)    =C0(1,2);
%                   Sh0(i,counter+1)  =C0(1,1);
%                   Sh1(i,counter)    =C0(2,2);
%                   Sh1(i,counter+1)  =C0(2,1);
%                   
%               end
%               
%            end
%            if(BitmapImage(i,j)==1)
%               randNumber = floor(1.9*rand(1)); 
%               if(randNumber==0)
%                   Sh0(i,counter)    =C1(1,1);
%                   Sh0(i,counter+1)  =C1(1,2);
%                   Sh1(i,counter)    =C1(2,1);
%                   Sh1(i,counter+1)  =C1(2,2);
%               end
%               if(randNumber==1)
%                   Sh0(i,counter)    =C1(1,2);
%                   Sh0(i,counter+1)  =C1(1,1);
%                   Sh1(i,counter)    =C1(2,2);
%                   Sh1(i,counter+1)  =C1(2,1);
%                   
%               end
%            end
       end
    end
    
    
    
    objout = bitxor(SH(:,:,1),SH(:,:,2));
    %figure
    %for i=1:1:nrShares
    %   subplot(nrShares,1,i)
    %   imshow(SH(:,:,i));
    %end
    
     for i=3:1:nrShares
         objout = bitxor(objout,SH(:,:,i));
     end
    
    axes(handles.axes5)
    imshow(SH(:,:,1));
    axes(handles.axes6)
    imshow(SH(:,:,2));
    axes(handles.axes7)
    imshow(SH(:,:,3));
    axes(handles.axes12)
    imshow(SH(:,:,4));
    axes(handles.axes13)
    imshow(objout);
%     Sh2=SH(:,:,1);
%     Sh3=SH(:,:,2);
%     figure
%     subplot(2,1,1)
%     imshow(Sh2);
%     subplot(2,1,2)
%     imshow(Sh3);
%     
%     objout = bitxor(Sh2,Sh3)
%     figure
%     subplot(2,1,1)
%     imshow(objout);

    
%     P(1,1,1)=1;
%     P(1,1,2)=2;
%     P(1,1,3)=3;
%     P(1,2,1)=1;
%     P(1,2,2)=2;
%     P(1,2,3)=3;
%     
%     
%     P(2,1,1)=4;
%     P(2,1,2)=5;
%     P(2,1,3)=6;
%     P(2,2,1)=7;
%     P(2,2,2)=8;
%     P(2,2,3)=9;
%     
%     disp(P(1,:,:));
    %nrShares=str2num(nrShares);
    %matrix=encode(Gimage,nrShares);

    %S0=matrix(:,1:nrShares);
    %S1=matrix(:,nrShares+1:nrShares*2);
  
    %disp(S0(:,:));
    %disp(S1(:,:));
    %disp(Gimage); 
    
    
    handles.sh1=SH(:,:,1);
    handles.sh2=SH(:,:,2);
    handles.sh3=SH(:,:,3);
    handles.sh4=SH(:,:,4);
    guidata(hObject, handles);


function edit31_Callback(hObject, eventdata, handles)
% hObject    handle to edit31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit31 as text
%        str2double(get(hObject,'String')) returns contents of edit31 as a double


% --- Executes during object creation, after setting all properties.
function edit31_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
