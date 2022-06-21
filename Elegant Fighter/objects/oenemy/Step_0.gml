/// @description Attack if player is already dodging
if (atk > -1 && !attacking) {
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
		var atkMax = windupMax - 15;
		var atkMin = 5;
		if (alarm_get(1) > atkMin && alarm_get(1) <= atkMax) alarm_set(1, atkMin);
		if (alarm_get(2) > atkMin && alarm_get(2) <= atkMax) alarm_set(2, atkMin);
	}
}