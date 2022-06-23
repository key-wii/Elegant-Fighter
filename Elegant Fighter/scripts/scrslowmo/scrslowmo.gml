// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function slowMo() {
	if (keyboard_check(inputSlow1) || keyboard_check(inputSlow2)) {
		global.slow = true;
		room_speed = 20;
		spd = 5;
	} else {
		global.slow = false;
		room_speed = 60;
		spd = 4;
	}
}