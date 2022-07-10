function kickCombo() {
	if (cooldownKick > 0) exit;
	if (keyboard_check_pressed(inputKick1) || keyboard_check_pressed(inputKick2) ||
		gamepad_button_check_pressed(0, gp_face2) || gamepad_button_check_pressed(4, gp_face2)) {
			comboContinue = true;
	}
}