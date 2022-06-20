/// @description Knockback
speed = floor(kBack / 2);
kBack--;
if (speed <= 0) instance_change(oPlayer, false);