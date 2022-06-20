/// @description Check if still pressing Up
if (!keyboard_check(inputU1) && !keyboard_check(inputU2)) {
	instance_change(oPlayer, false);
}