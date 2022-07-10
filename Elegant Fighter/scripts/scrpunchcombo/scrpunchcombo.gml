function punchCombo() {
	if (cooldownPunch > 0) exit;
	if (keyboard_check_pressed(inputPunch1) || keyboard_check_pressed(inputPunch2) ||
		gamepad_button_check_pressed(0, gp_face4) || gamepad_button_check_pressed(4, gp_face4)) {
			comboContinue = true;
	}
}