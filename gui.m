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

% Last Modified by GUIDE v2.5 26-Dec-2025 19:01:45

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
open_system('pathFollowingWithObstacleAvoidanceExample');
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
    % 1. Model Name
    cla(handles.axes1);                % Clears the axes content
    set(handles.edit1, 'String', '');  % Clears Text Box 1
    set(handles.edit2, 'String', '');  % Clears Text Box 2
    modelName = 'pathFollowingWithObstacleAvoidanceExample';
    
    % 2. Initialize sim_pose in Base Workspace
    initial_pose = [0, 0, 0]; 
    assignin('base', 'sim_pose', initial_pose);
    
    % 3. Load and Start Simulink
  
        load_system(modelName);
    set_param(modelName, 'SimulationCommand', 'start');
    

    
        % If timer doesn't exist, create it here or ensure it's in OpeningFcn
        handles.my_timer = timer('ExecutionMode', 'fixedRate', ...
                                 'Period', 0.1, ...
                                 'TimerFcn', {@update_display, hObject});
        start(handles.my_timer);
    
    
    % 5. Update UI State
    set(handles.pushbutton2, 'Enable', 'off');
    set(handles.pushbutton3, 'Enable', 'on');
    
    % Save changes to handles
    guidata(hObject, handles);
    

% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
model_name = 'pathFollowingWithObstacleAvoidanceExample'; % ضع اسم ملف السيمولينك هنا بدون .slx
    

    % بدء المحاكاة
    set_param(model_name, 'SimulationCommand', 'stop');
    
    % تحديث حالة الأزرار
    set(handles.pushbutton2, 'Enable', 'on');
    set(handles.pushbutton3, 'Enable', 'of');
    
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
    % 1. تشغيل ROS مباشرة
    rosinit;
    
    % 2. طباعة رسالة في الكوماند ويندو للتأكيد
    disp('ROS Master has been started.');

    % 3. تحديث حالة الأزرار في الواجهة
    set(handles.pushbutton4, 'Enable', 'off'); % تعطيل زر البدء
    set(handles.pushbutton5, 'Enable', 'on');  % تفعيل زر الإيقاف (Stop ROS)

    % 4. تحديث الشاشة فوراً
    drawnow;
    
    % 5. حفظ التغييرات في الواجهة
    guidata(hObject, handles);
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
    % 1. تشغيل ROS مباشرة
    rosshutdown;
    
    % 2. طباعة رسالة في الكوماند ويندو للتأكيد
    disp('ROS Master has been started.');

    % 3. تحديث حالة الأزرار في الواجهة
    set(handles.pushbutton4, 'Enable', 'on'); % تعطيل زر البدء
    set(handles.pushbutton5, 'Enable', 'off');  % تفعيل زر الإيقاف (Stop ROS)

    % 4. تحديث الشاشة فوراً
    drawnow;
    
    % 5. حفظ التغييرات في الواجهة
    guidata(hObject, handles);
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
    % تشغيل مساعد الروبوت
    exampleHelper = ExampleHelperSimulinkRobotROS('ObstacleAvoidance');
    
    % تحديث الواجهة
    drawnow;
    
    % حفظ الكائن في handles لمنعه من الاختفاء من الذاكرة
    handles.robotHelper = exampleHelper;
    guidata(hObject, handles);
    
    disp('Robot figure should stay open now.');


% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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

   function update_display(obj, event, hFigure)
        
        
 
% Get the handles from the figure
        handles = guidata(hFigure);
        
        % 1. Get data from Base Workspace
        data = evalin('base', 'sim_pose'); 
        
        all_x = data(:, 1);
        all_y = data(:, 2);
        
        % 2. Update Text Boxes
        set(handles.edit1, 'String', num2str(all_x(end), '%.2f'));
        set(handles.edit2, 'String', num2str(all_y(end), '%.2f'));
        
        % 3. Plotting
        plot(handles.axes1, all_x, all_y, 'LineWidth', 2, 'Color', 'b');
        hold(handles.axes1, 'on');
        plot(handles.axes1, all_x(end), all_y(end), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
        hold(handles.axes1, 'off');
        
        grid(handles.axes1, 'on'); 
        drawnow limitrate;