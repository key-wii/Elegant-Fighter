/// @description Hit
var max_juggle = 3;
if (!lethal || !instance_exists(owner) || other.juggleCount >= max_juggle || other.object_index == oEnemy_knockdown) exit;

var enemy = other;
with (owner) target = enemy.id;

with (enemy) {
	prev_object = object_index;
	instance_change(oEnemy_hurt, true);
	if (other.last) knockdown = true;
	else knockdown = false
	direction = other.kDir;
	
	//Used for mixed HIGH + LOW combo
	//aka Punch-Kick-Punch or Kick-Punch-Kick
	kBack = other.kBackPower;
	if (lastHitType != other.atkType) {
		juggleCount++;
		if (juggleCount >= max_juggle) {
			knockdown = true;
			if (dir == RIGHT) direction += 30;
			else direction -= 30;
		}
	} else juggleCount = 0;
	lastHitType = other.atkType;
	
	y += kBack;
	hp -= 1;
	if (hp <= 0) broken = true;
}

lethal = false;