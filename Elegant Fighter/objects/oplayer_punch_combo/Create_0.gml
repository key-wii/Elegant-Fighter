/// @description Attack in 3 frames
strState = "Punch Combo";
hitbox = noone;
image_index = 2;

image_speed = 1.6;
y1 = sprite_height * -1;
y2 = sprite_height * -.5;
alarm_set(0, 2);

nextState = oPlayer_punch_last;
comboContinue = false;