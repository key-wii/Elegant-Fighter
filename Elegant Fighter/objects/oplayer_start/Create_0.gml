inputL1 = ord("A");
inputL2 = vk_left;
inputR1 = ord("D");
inputR2 = vk_right;
spd = 4;

inputU1 = ord("W");
inputU2 = vk_up;
inputD1 = ord("S");
inputD2 = vk_down;

inputPunch1 = ord("Z");
inputPunch2 = ord("N");
inputKick1 = ord("X");
inputKick2 = ord("M");
cooldownPunchMax = 5;
cooldownPunch = 0;
cooldownKickMax = 5;
cooldownKick = 0;

inputSlow1 = vk_space;
inputSlow2 = vk_shift;

//inputPause1 = vk_enter;
//inputPause2 = vk_escape;

xLeft1 = sprite_width * -1.5;
xLeft2 = sprite_width * -.5;
xRight1 = sprite_width * .5;
xRight2 = sprite_width * 1.5;
dir = RIGHT;

falling = false;
target = noone;

pColor = make_color_rgb(0, 174, 240);

targetRot = 0;
targetRot2 = 0;

instance_change(oPlayer, true);