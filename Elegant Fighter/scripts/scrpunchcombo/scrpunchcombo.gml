function punchCombo() {
	if (cooldownPunch > 0) exit;
	if (keyboard_check(inputPunch1) || keyboard_check(inputPunch2) ||
		gamepad_button_check(0, gp_face4) || gamepad_button_check(4, gp_face4)) {
			if (object_index == oPlayer_punch_combo)
				comboContinue = true;
			else instance_change(oPlayer_punch_combo, true);
	}
}