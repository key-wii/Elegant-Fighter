/// @description Stop attacking
instance_destroy(hitbox);
//instance_destroy(text);
atk = -1;
attacking = false;
alarm_set(0, 80);