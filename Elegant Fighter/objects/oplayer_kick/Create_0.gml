/// @description Attack in 3 frames
xMoveInput();
	
strState = "Kick";
hitbox = noone;
image_index = 0;

image_speed = .8;
y1 = sprite_height * -.5;
y2 = 0;
alarm_set(0, 12);

nextState = oPlayer;
comboContinue = false;