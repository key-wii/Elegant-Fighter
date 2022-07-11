function slowMo() {
	if (keyboard_check(inputSlow1) || keyboard_check(inputSlow2) ||
		gamepad_button_check(0, gp_shoulderr) || gamepad_button_check(4, gp_shoulderr) ||
		gamepad_button_check(0, gp_shoulderl) || gamepad_button_check(4, gp_shoulderl)) {
			global.slow = true;
			room_speed = 20;
			spd = 5;
	} else {
		global.slow = false;
		room_speed = 60;
		spd = 4;
	}
}