/// @description Check if still pressing Up
if (!keyboard_check(inputU1) && !keyboard_check(inputU2) &&
	!gamepad_button_check(0, gp_padu) && gamepad_axis_value(0, gp_axislv) > -.5 &&
	!gamepad_button_check(4, gp_padu) && gamepad_axis_value(4, gp_axislv) > -.5) {
		endDodge = true;
		sprite_index = sprPlayer_hop_end;
}