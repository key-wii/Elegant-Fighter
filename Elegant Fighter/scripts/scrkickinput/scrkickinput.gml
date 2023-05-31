function kickInput(buffer) {
	if (keyboard_check(inputKick1) || keyboard_check(inputKick2) ||
		gamepad_button_check(0, gp_face2) || gamepad_button_check(4, gp_face2)) {
			if (buffer) alarm_set(11, 1);
			else if (cooldownKick == 0) {
				instance_change(oPlayer_kick, true);
			}
	}
}