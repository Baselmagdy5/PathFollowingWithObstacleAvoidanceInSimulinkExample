function MyRobotGUI
    % إنشاء النافذة الرئيسية
    fig = figure('Name', 'Robot Control GUI', 'Position', [100 100 400 300], 'MenuBar', 'none');

    % أزرار التحكم
    uicontrol('Style', 'pushbutton', 'String', 'Open Simulink', 'Position', [50 230 120 40], 'Callback', @(~,~) open_system('pathFollowingWithObstacleAvoidanceExample'));
    uicontrol('Style', 'pushbutton', 'String', 'Start Simulation', 'Position', [50 180 120 40], 'Callback', @(~,~) set_param('pathFollowingWithObstacleAvoidanceExample', 'SimulationCommand', 'start'));
    uicontrol('Style', 'pushbutton', 'String', 'Stop Simulation', 'Position', [180 180 120 40], 'Callback', @(~,~) set_param('pathFollowingWithObstacleAvoidanceExample', 'SimulationCommand', 'stop'));

    % عرض الإحداثيات
    uicontrol('Style', 'text', 'String', 'Current Pose (X, Y, Theta):', 'Position', [50 120 200 20], 'HorizontalAlignment', 'left');
    poseDisplay = uicontrol('Style', 'text', 'String', '[0, 0, 0]', 'Position', [50 90 300 30], 'FontSize', 12, 'ForegroundColor', 'blue');

    % إنشاء مؤقت لتحديث البيانات من الموديل
    t = timer('ExecutionMode', 'fixedRate', 'Period', 0.1, 'TimerFcn', @(~,~) updateGUI(poseDisplay));
    start(t);
    
    % تنظيف المؤقت عند إغلاق النافذة
    set(fig, 'DeleteFcn', @(~,~) stop(t));
end

function updateGUI(displayHandle)
    % جلب البيانات من الموديل (يفترض وجود بلوك ToWorkspace باسم 'currentPose')
    try
        pose = evalin('base', 'currentPose.Data(end,:)');
        set(displayHandle, 'String', sprintf('[%.2f, %.2f, %.2f]', pose(1), pose(2), pose(3)));
    catch
        % في حال عدم بدء المحاكاة بعد
    end
end