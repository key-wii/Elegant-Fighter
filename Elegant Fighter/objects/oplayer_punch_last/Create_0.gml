/// @description Attack in 3 frames
strState = "Punch Last";
hitbox = noone;
image_index = 0;

image_speed = 1;
y1 = sprite_height * -1;
y2 = sprite_height * -.5;
alarm_set(0, 2);

nextState = oPlayer;
comboContinue = false;