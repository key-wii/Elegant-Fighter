/// @description Draw self & text
draw_self();
if (attacking) var strState = "Attack";
else if (atk > -1) var strState = "Windup";
else var strState = "Default";
drawText(fntText3, fa_center, fa_middle, x, room_height * .9, strState, c_orange, c_orange, c_black, c_black, 1, 1, 0);