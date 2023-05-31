function punchInput(buffer) {
	if (keyboard_check(inputPunch1) || keyboard_check(inputPunch2) ||
		gamepad_button_check(0, gp_face4) || gamepad_button_check(4, gp_face4)) {
			if (buffer) alarm_set(10, 1);
			else if (cooldownPunch == 0) {
				instance_change(oPlayer_punch, true);
			}
	}
}