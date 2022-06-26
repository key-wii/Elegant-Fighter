/// @description Check if still pressing Down
if (!keyboard_check(inputD1) && !keyboard_check(inputD2) &&
	!gamepad_button_check(0, gp_padd) && gamepad_axis_value(0, gp_axislv) < .5 &&
	!gamepad_button_check(4, gp_padd) && gamepad_axis_value(4, gp_axislv) < .5) {
		endDodge = true;
		sprite_index = sprPlayer_duck_end;
}