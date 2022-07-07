/// @description 

//Stop Attacking
if (image_speed < 0) {
	if (!comboContinue) instance_change(oPlayer, true);
	else {
		instance_change(oPlayer, true);
		instance_change(oPlayer_kick_combo, true);
	}
}

//Reverse animation
image_index = 2;
image_speed = -.4;