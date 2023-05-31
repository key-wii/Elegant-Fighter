/// @description Attack in 3 frames
xMoveInput();
	
strState = "Punch";
hitbox = noone;
image_index = 0;

image_speed = .8;
y1 = sprite_height * -1;
y2 = sprite_height * -.5;
alarm_set(0, 12);

nextState = oPlayer;
comboContinue = false;