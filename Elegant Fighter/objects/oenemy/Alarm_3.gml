/// @description Stop attacking
instance_destroy(hitbox);
atk = -1;
attacking = false;
alarm_set(0, 80);