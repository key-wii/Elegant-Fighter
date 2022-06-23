/// @description Check if still pressing Down
if (!keyboard_check(inputD1) && !keyboard_check(inputD2)) {
	endDodge = true;
	sprite_index = sprPlayer_duck_end;
}