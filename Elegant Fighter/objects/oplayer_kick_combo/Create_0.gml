/// @description Attack in 3 frames
strState = "Kick Combo";
hitbox = noone;
image_index = 0;

image_speed = .5;
y1 = sprite_height * -.5;
y2 = 0;
alarm_set(0, 2);

nextState = oPlayer_kick_last;
comboContinue = false;