/// @description Knockback
speed = floor(clamp(kBack, 0, 9999) * 2.5);
kBack--;
/*image_angle = clamp(image_angle / 5, image_angle - 5, image_angle + 5);
if (kBack > 5) image_angle = clamp(image_angle + direction * .025, 0, 270);*/
//if (speed <= 0) instance_change(prev_object, true);
if (kBack <= 0) instance_change(enemyType, true);