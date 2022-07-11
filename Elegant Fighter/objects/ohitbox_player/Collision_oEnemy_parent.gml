/// @description Hit
if (!lethal || !instance_exists(owner)) exit;

var enemy = other;
with (owner) target = enemy.id;

with (enemy) {
	prev_object = object_index;
	instance_change(oEnemy_hurt, true);
	if (other.last) knockdown = true;
	else knockdown = false;
	kBack = 10;
	
	y += kBack;
	direction = other.kDir;
}

lethal = false;