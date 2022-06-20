/// @description 
image_angle -= 4;
theta += 4;
if (theta >= 360) theta -= 360;

if (!instance_exists(owner)) {
	instance_destroy();
	exit;
}
var xx = owner.x;
var yy = owner.y - owner.sprite_height + 20;
x = xx + lengthdir_x(radius, theta);
y = yy + lengthdir_y(radius, theta);