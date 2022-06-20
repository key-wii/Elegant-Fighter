/// @description Knockback
speed = floor(kBack * .9);
kBack--;
if (speed <= 0) instance_change(oPlayer, true);