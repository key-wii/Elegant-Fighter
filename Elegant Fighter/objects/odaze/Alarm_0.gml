var dazeObj = instance_create_layer(x, y - sprite_height, "Particle", oDaze);
dazeObj.image_angle = image_angle + 10;
dazeObj.owner = owner;
dazeObj.stars = stars + 1;
dazeObj.theta = theta + 120;
if (stars == 3) dazeObj.theta += 60;
var scale = .4;
if (stars >= 3) scale = .2;
dazeObj.image_xscale = scale;
dazeObj.image_yscale = scale;
with (dazeObj) if (stars < 6) alarm_set(0, 6);

stars++;