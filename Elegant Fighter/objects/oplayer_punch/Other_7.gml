/// @description 

//Stop Attacking
if (image_speed < 0) {
	if (!comboContinue) instance_change(nextState, true);
	else {
		instance_change(oPlayer, true);
		instance_change(oPlayer_punch_combo, true);
		exit;
	}
}

//Reverse animation
image_index = 3;
image_speed = -.4;