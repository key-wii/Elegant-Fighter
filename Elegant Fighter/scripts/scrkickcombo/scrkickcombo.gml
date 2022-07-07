function kickCombo() {
	if (cooldownKick > 0) exit;
	if (keyboard_check_pressed(inputKick1) || keyboard_check_pressed(inputKick2) ||
		gamepad_button_check(0, gp_face2) || gamepad_button_check(4, gp_face2)) {
			if (object_index == oPlayer_kick_combo)
				comboContinue = true;
			else instance_change(oPlayer_kick_combo, true);
	}
}