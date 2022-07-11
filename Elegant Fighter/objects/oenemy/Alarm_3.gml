/// @description Stop attacking, Set to Dazed if Player Dodged
var xx1 = 0, xx2 = 0;
switch (dir) {
	case LEFT:
		xx1 = x + xLeft1; xx2 = x + xLeft2; break;
	case RIGHT:
		xx1 = x + xRight1; xx2 = x + xRight2; break;
}
var stateDodge;
switch (atk) {
	case HIGH:
		stateDodge = oPlayer_duck; break;
	case LOW:
		stateDodge = oPlayer_hop; break;
}
var player = oPlayer_parent;
var inRange = player.x >= xx1 && player.x <= xx2 && player.object_index == stateDodge;
if (inRange) {
	dazed = true;
	dizzyParticles();
	alarm_set(5, dazeLen);
}
else alarm_set(4, 40);

instance_destroy(hitbox);
//instance_destroy(text);
atk = -1;
attacking = false;