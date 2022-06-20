var dazeObj = instance_create_layer(x, y - sprite_height, "Particle", oDaze);
dazeObj.image_angle = image_angle + 15;
dazeObj.owner = owner;
dazeObj.xMax = xMax;
dazeObj.stars = stars + 1;
dazeObj.image_xscale = .5;
dazeObj.image_yscale = .5;
with (dazeObj) if (stars < 4) alarm_set(0, 30);

stars++;