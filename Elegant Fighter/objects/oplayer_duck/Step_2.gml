/// @description Check if still pressing Down
if (!keyboard_check(inputD1) && !keyboard_check(inputD2)) {
	instance_change(oPlayer, false);
}