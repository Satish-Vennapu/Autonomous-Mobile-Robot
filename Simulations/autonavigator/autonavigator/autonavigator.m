
function varargout = autonavigator(varargin)
%AUTONAVIGATOR M-file for autonavigator.fig
%      AUTONAVIGATOR, by itself, creates a new AUTONAVIGATOR or raises the existing
%      singleton*.
%
%      H = AUTONAVIGATOR returns the handle to a new AUTONAVIGATOR or the handle to
%      the existing singleton*.
%
%      AUTONAVIGATOR('Property','Value',...) creates a new AUTONAVIGATOR using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to autonavigator_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      AUTONAVIGATOR('CALLBACK') and AUTONAVIGATOR('CALLBACK',hObject,...) call the
%      local function named CALLBACK in AUTONAVIGATOR.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help autonavigator

% Last Modified by GUIDE v2.5 13-Aug-2007 00:16:00

% Begin initialization code - DO NOT EDIT


gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @autonavigator_OpeningFcn, ...
                   'gui_OutputFcn',  @autonavigator_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before autonavigator is made visible.
function autonavigator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for autonavigator
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes autonavigator wait for user response (see UIRESUME)
% uiwait(handles.figure1);
handles.x=10;
handles.y=20;
handles.angle_v=30;
handles.angle_t=30;
handles.conf='LE';
handles.v=5;
handles.status_cb=0;
handles.tft=0;
handles.trt=0;
handles.tvb=0;
handles.delta=0;
handles.right=0;
handles.left=0;
handles.vplus=0;
handles.vminus=0;
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = autonavigator_OutputFcn(hObject, eventdata, handles)
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
handles.x=str2double(get(hObject,'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double

handles.y=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
handles.angle_v=str2double(get(hObject,'String'));
guidata(hObject,handles);



% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double
handles.angle_t=str2double(get(hObject,'String'));
guidata(hObject,handles);



% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double
handles.v=str2double(get(hObject,'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double
handles.conf=get(hObject,'String');
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on button press in StartSim.
function StartSim_Callback(hObject, eventdata, handles)
% hObject    handle to StartSim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    x=handles.x;
    y=handles.y;
    angle_v=handles.angle_v;
    angle_t=handles.angle_t;
    v=handles.v;
    conf=handles.conf;
    status_cb=handles.status_cb;
    tft=handles.tft;
    trt=handles.trt;
    tvb=handles.tvb;
    delta=handles.delta;
    and_method=get(handles.listbox2,'Value');
    traj_algo=get(handles.pathcalc,'Value');
    distance=track_gui(x,y,angle_v,angle_t,conf,v,status_cb,tft,trt,tvb,delta,and_method,traj_algo);
       

% --- Executes during object creation, after setting all properties.
function Axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate Axes1



% --- Executes on button press in ClearWindow.
function ClearWindow_Callback(hObject, eventdata, handles)
% hObject    handle to ClearWindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cla;
clear all;


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


handles.status_cb=get(hObject,'Value');
guidata(hObject,handles);


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
handles.trt=get(hObject,'Value');
guidata(hObject,handles);

% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3
handles.tft=get(hObject,'Value');
guidata(hObject,handles);

% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4
handles.tvb=get(hObject,'Value');
guidata(hObject,handles);


% --- Executes on button press in checkbox9.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox9
if get(hObject,'Value')
    % UIWAIT makes autonavigator wait for user response (see UIRESUME)
    uiwait(handles.figure1);
else
    uiresume(handles.figure1);
end



function edit22_Callback(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit22 as text
%        str2double(get(hObject,'String')) returns contents of edit22 as a double
handles.delta=str2double(get(hObject,'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2




% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on button press in Initialize.
function Initialize_Callback(hObject, eventdata, handles)
% hObject    handle to Initialize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% this function is used to control manually the motion of the vehicle uwing mouse buttons    
    x=handles.x;
    y=handles.y;
    angle_v=handles.angle_v;
    angle_t=handles.angle_t;
    v=handles.v;
    status_cb=handles.status_cb;
    tft=handles.tft;
    trt=handles.trt;
    tvb=handles.tvb;
   while(1)
        handles=guidata(hObject);
        left=handles.left;
        right=handles.right;
        vplus=handles.vplus;
        vminus=handles.vminus;
        [lf rf vpf vmf]=hum_cnt(x,y,angle_v,angle_t,v,status_cb,tft,trt,tvb,left,right,vplus,vminus);
        if lf==1
            handles.left=0;
            guidata(hObject,handles);
        end
        if rf==1
            handles.right=0;
            guidata(hObject,handles);
        end
        if vpf==1
            handles.vplus=0;
            guidata(hObject,handles);
        end
        if vmf==1
            handles.vminus=0;
            guidata(hObject,handles);
        end
    end
             
   
% --- Executes on button press in RightSteer.
function RightSteer_Callback(hObject, eventdata, handles)
% hObject    handle to RightSteer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    

    handles.right=1;
    handles.left=0;
    handles.vplus=0;
    handles.vminus=0;
    guidata(hObject,handles);

% --- Executes on button press in LeftSteer.
function LeftSteer_Callback(hObject, eventdata, handles)
% hObject    handle to LeftSteer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    
    handles.right=0;
    handles.left=1;
    handles.vplus=0;
    handles.vminus=0;
    guidata(hObject,handles);

    %distance=hum_cnt(x,y,angle_v,angle_t,v,status_cb,tft,trt,tvb,left,right,vplus,vminus);
   

% --- Executes on button press in vplus.
function vplus_Callback(hObject, eventdata, handles)
% hObject    handle to vplus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  
    handles.right=0;
    handles.left=0;
    handles.vplus=1;
    handles.vminus=0;
    guidata(hObject,handles);

% --- Executes on button press in vminus.
function vminus_Callback(hObject, eventdata, handles)
% hObject    handle to vminus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
    handles.right=0;
    handles.left=0;
    handles.vplus=0;
    handles.vminus=1;
    guidata(hObject,handles);


% --- Executes on button press in StartKeyHum.
function StartKeyHum_Callback(hObject, eventdata, handles)

% hObject    handle to StartKeyHum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    x=handles.x;
    y=handles.y;
    angle_v=handles.angle_v;
    angle_t=handles.angle_t;
    v=handles.v;
    status_cb=handles.status_cb;
    tft=handles.tft;
    trt=handles.trt;
    tvb=handles.tvb;

while(1)

    action_code=double(get(gcbf,'Currentcharacter'));

    left=0;
    right=0;
    vplus=0;
    vminus=0;
    
    if action_code==28
            left=1;
            right=0;
            vplus=0;
            vminus=0;
            set(gcbf,'Currentcharacter','c');
    elseif action_code==29
            left=0;
            right=1;
            vplus=0;
            vminus=0;
            set(gcbf,'Currentcharacter','c');
    elseif action_code==30
            left=0;
            right=0;
            vplus=1;
            vminus=0;
            set(gcbf,'Currentcharacter','c');
    elseif action_code==31
            left=0;
            right=0;
            vplus=0;
            vminus=1;
            set(gcbf,'Currentcharacter','c');
    elseif action_code==120
            break;
    end
    
   hum_cnt(x,y,angle_v,angle_t,v,status_cb,tft,trt,tvb,left,right,vplus,vminus);
    
end


% --- Executes on selection change in pathcalc.
function pathcalc_Callback(hObject, eventdata, handles)
% hObject    handle to pathcalc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns pathcalc contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pathcalc


% --- Executes during object creation, after setting all properties.
function pathcalc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pathcalc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


