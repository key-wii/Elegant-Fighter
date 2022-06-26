function kickInput() {
	if (cooldownKick > 0) exit;
	if (keyboard_check(inputKick1) || keyboard_check(inputKick2) ||
		gamepad_button_check(0, gp_face2) || gamepad_button_check(4, gp_face2)) {
			instance_change(oPlayer_kick, true);
	}
}