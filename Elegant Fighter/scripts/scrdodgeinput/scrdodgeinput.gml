function dodgeInput() {
	if (!falling) {
		if (keyboard_check(inputU1) || keyboard_check(inputU2) ||
			gamepad_button_check(0, gp_padu) || gamepad_axis_value(0, gp_axislv) <= -.5 ||
			gamepad_button_check(4, gp_padu) || gamepad_axis_value(4, gp_axislv) <= -.5) {
				instance_change(oPlayer_hop, true);
		}
		if (keyboard_check(inputD1) || keyboard_check(inputD2) ||
			gamepad_button_check(0, gp_padd) || gamepad_axis_value(0, gp_axislv) >= .5 ||
			gamepad_button_check(4, gp_padd) || gamepad_axis_value(4, gp_axislv) >= .5) {
				instance_change(oPlayer_duck, true);
		}
	}
}