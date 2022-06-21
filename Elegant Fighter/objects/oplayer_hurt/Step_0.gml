/// @description Knockback
speed = floor(kBack * 2.5);
kBack--;
image_angle = clamp(image_angle / 5, image_angle - 5, image_angle + 5);
if (kBack > 5) image_angle = clamp(image_angle + direction * .025, 0, 270);
if (speed <= 0) instance_change(oPlayer, true);