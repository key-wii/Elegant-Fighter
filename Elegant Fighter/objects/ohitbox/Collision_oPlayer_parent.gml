/// @description Hit
if (!lethal) exit;

with (other) {
	instance_change(oPlayer_hurt, true);
	kBack = 15;
	//kDir = other.kDir;
	direction = other.kDir;
}

lethal = false;