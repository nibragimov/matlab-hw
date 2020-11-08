% Shows the initial and final pose of a space-ship which undergoes
% roll-pitch-yaw and translation.
%clear all
clf
handle_axes=axes('XLim', [-10,10], 'YLim', [-10,10], 'ZLim', [-10,10]);
xlabel('e_1');
ylabel('e_2');
zlabel('e_3');

view(3);
grid on;
axis equal
camlight

% Create ship-1
trf_ship1_root= hgtransform('Parent', handle_axes);
%Parent, specified as an Axes, Group, or Transform object.
h_original_ship= make_spaceship(trf_ship1_root, 0.8);

% Create ship-2 translated and rotated w.r.t. ship-1
%trf_ship2_ship1= hgtransform('Parent',trf_ship1_root);
%h_ship2= make_spaceship(trf_ship2_ship1, 0.8);

%set row, yaw, pitch angles
roll= -pi/10;
pitch= pi/8;
yaw= pi;

%create transform objects with rotate properties
%trf_roll= makehgtform('xrotate', roll);
%trf_pitch= makehgtform('yrotate', pitch);
%trf_yaw= makehgtform('zrotate', yaw);


%combine all rotations by multiplication
%trf_rpy= trf_yaw*trf_pitch*trf_roll;

%set translation matrix
%translation= [3,2,3]; % 4,2,2
%create transform object from translation matrix
%trf_translate= makehgtform('translate', translation);

%combine rotation with translation with multiplication
%trf_final= trf_translate*trf_rpy;

%apply rotation and translation to ship-2 
%set(trf_ship2_ship1, 'Matrix', trf_final);
%draw all objects
drawnow;

transx = (0:0.3:3.0);
transy = (0:0.2:2.0);
h = (0:0.3:3.0);
zrot = (0:pi/10:pi);
yrot = (0:pi/80:pi/8);
xrot = (0:-pi/100:-pi/10);
for i = 1:numel(transx)
    set(handle_axes, 'XLim', [-8,8], 'YLim', [-8,8], 'ZLim', [0,8]);
    trans = makehgtform('translate', [transx(i) transy(i) h(i)]);
    rotx = makehgtform('xrotate', xrot(i));
    roty = makehgtform('yrotate', yrot(i));
    rotz = makehgtform('zrotate', zrot(i));
    set(trf_ship1_root, 'Matrix', trans*rotz*roty*rotx);
    pause(0.2);   
end

    

    


