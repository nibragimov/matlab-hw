function [ myhandles ] = make_spaceship(trf_root, transparency)
% Makes a space-ship with the root transform as the given transform.
% The surfaces are drawn with the given transparency in [0,1]
% A vector of handles to all the surfaces is returned.

ship_dish_profile= 2*sin(linspace(0, pi, 15));
%The function returns the Xc, Yc, and Zc coordinates as three 21-by-21 matrices.
[Xc, Yc, Zc]= cylinder(ship_dish_profile);

% Top dish
%create transform object trf_top_root from trf_root transform object 
trf_top_root= hgtransform('Parent', trf_root);

%set the property "Matrix" of top_root by creating 4x4 transformation
%matrix by makehgtform
set(trf_top_root, 'Matrix', makehgtform('translate', [0, 0, -0.2]));
color_top= [102/255 0/255 51/255];
%draw surface plot with the following parameters
myhandles(1)= surface(Xc, Yc, Zc, 'Parent', trf_top_root, 'FaceColor', color_top, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_top, 'EdgeAlpha', transparency);

% Bottom dish
trf_bottom_root= hgtransform('Parent', trf_root);
set(trf_bottom_root, 'Matrix', makehgtform('translate', [0, 0, 0.2]));
color_bottom= [102/255 0/255 51/255];
myhandles(2)= surface(Xc, Yc, Zc, 'Parent', trf_bottom_root, 'FaceColor', color_bottom, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_bottom, 'EdgeAlpha', transparency);

% creates x, y, z coordinates of unit cylinder to draw left tail
[Xt, Yt, Zt]= cylinder([0.4 , 0.3 , 0]);


% Left tail
trf_tailleft_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [1,1,3]);
trf_Ry= makehgtform('yrotate', -pi/2);
trf_T= makehgtform('translate', [-3, 0.75, 2]);
% Interpret the order as BFT (left to right)
set(trf_tailleft_root, 'Matrix', trf_T*trf_Ry*trf_scale);
color_tail_left= [102/255 0/255 51/255]; 
myhandles(3)= surface(Xt, Yt, Zt, 'Parent', trf_tailleft_root, 'FaceColor', color_tail_left, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_tail_left, 'EdgeAlpha', transparency);

color_tail_right = [102/255 0/255 51/255];
[Xrt, Yrt, Zrt]= cylinder([0.4 , 0.3 , 0]);
trf_tailright_root= hgtransform('Parent', trf_tailleft_root);
trf_Tr= makehgtform('translate', [0, -1.5, 0]);
set(trf_tailright_root, 'Matrix', trf_Tr);
myhandles(4)= surface(Xrt, Yrt, Zrt, 'Parent', trf_tailright_root, 'FaceColor', color_tail_right, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_tail_right, 'EdgeAlpha', transparency);


color_leftstand = [0 1 1];
[Xls, Yls, Zls]= cylinder([0.1, 0.1, 0.1]);
trf_leftstand_root = hgtransform('Parent', trf_tailleft_root);
trf_lsy= makehgtform('yrotate', pi/2 - pi/16);
trf_Tls= makehgtform('translate', [-1.4, 0, 0]);
trf_scale_ls= makehgtform('scale', [1,1,1.1]);
set(trf_leftstand_root, 'Matrix', trf_Tls*trf_lsy*trf_scale_ls);
myhandles(5)= surface(Xls, Yls, Zls, 'Parent', trf_leftstand_root, 'FaceColor', color_leftstand, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_leftstand, 'EdgeAlpha', transparency);

color_rightstand = [0 1 1];
[Xrs, Yrs, Zrs]= cylinder([0.1, 0.1, 0.1]);
trf_rightstand_root = hgtransform('Parent', trf_tailleft_root);
trf_rsy= makehgtform('yrotate', pi/2 - pi/16);
trf_Trs= makehgtform('translate', [-1.4, -1.5, 0]);
trf_scale_rs= makehgtform('scale', [1,1,1.1]);
set(trf_rightstand_root, 'Matrix', trf_Trs*trf_rsy*trf_scale_rs);
myhandles(6)= surface(Xrs, Yrs, Zrs, 'Parent', trf_rightstand_root, 'FaceColor', color_rightstand, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_rightstand, 'EdgeAlpha', transparency);


color_leftflank = [1 1 0];
[Xlf, Ylf, Zlf]= cylinder([0, 0.3, 0]);
trf_leftflank_root = hgtransform('Parent', trf_tailleft_root);
trf_Tlf= makehgtform('translate', [-1.5, 0, -1]);
trf_scale_lf= makehgtform('scale', [1,1,1.4]);
set(trf_leftflank_root, 'Matrix', trf_Tlf*trf_scale_lf);
myhandles(7)= surface(Xlf, Ylf, Zlf, 'Parent', trf_leftflank_root, 'FaceColor', color_leftflank, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_leftflank, 'EdgeAlpha', transparency);

color_rightflank = [1 1 0];
[Xrf, Yrf, Zrf]= cylinder([0, 0.3, 0]);
trf_rightflank_root = hgtransform('Parent', trf_tailleft_root);
trf_Trf= makehgtform('translate', [-1.5, -1.5, -1]);
trf_scale_rf= makehgtform('scale', [1,1,1.4]);
set(trf_rightflank_root, 'Matrix', trf_Trf*trf_scale_rf);
myhandles(8)= surface(Xrf, Yrf, Zrf, 'Parent', trf_rightflank_root, 'FaceColor', color_rightflank, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_rightflank, 'EdgeAlpha', transparency);

color_leftvent = [0 1 1];
[Xlv, Ylv, Zlv]= cylinder([0, 0.1, 0]);
trf_leftvent_root = hgtransform('Parent', trf_tailleft_root);
trf_Tlv= makehgtform('translate', [0, 0, -0.2]);
trf_scale_lv= makehgtform('scale', [3,3,1]);
set(trf_leftvent_root, 'Matrix', trf_Tlv*trf_scale_lv);
myhandles(9)= surface(Xlv, Ylv, Zlv, 'Parent', trf_leftvent_root, 'FaceColor', color_leftvent, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_leftvent, 'EdgeAlpha', transparency);

color_rightvent = [0 1 1];
[Xrv, Yrv, Zrv]= cylinder([0, 0.1, 0]);
trf_rightvent_root = hgtransform('Parent', trf_tailleft_root);
trf_Trv= makehgtform('translate', [0, -1.5, -0.2]);
trf_scale_rv= makehgtform('scale', [3,3,1]);
set(trf_rightvent_root, 'Matrix', trf_Trv*trf_scale_rv);
myhandles(10)= surface(Xrv, Yrv, Zrv, 'Parent', trf_rightvent_root, 'FaceColor', color_rightvent, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_rightvent, 'EdgeAlpha', transparency);

color_front = [1 1 0];
[Xf, Yf, Zf]= cylinder([0, 0.1, 0.4]);
trf_front_root = hgtransform('Parent', trf_tailleft_root);
trf_Tf= makehgtform('translate', [-1.5, -0.75, -2.5]);
trf_scale_f= makehgtform('scale', [1,3,1]);
set(trf_front_root, 'Matrix', trf_Tf*trf_scale_f);
myhandles(10)= surface(Xf, Yf, Zf, 'Parent', trf_front_root, 'FaceColor', color_front, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_front, 'EdgeAlpha', transparency);

% Your code here. Use left tail as a reference and design spaceship as
% shown in the class. You can come up with a new design.
end

