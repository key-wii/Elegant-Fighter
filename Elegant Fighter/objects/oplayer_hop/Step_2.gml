/// @description Check if still pressing Up
if (!keyboard_check(inputU1) && !keyboard_check(inputU2)) {
	endDodge = true;
	sprite_index = sprPlayer_hop_end;
}