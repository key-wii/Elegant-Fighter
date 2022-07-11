/// @description Make more stars
var dazeObj = instance_create_layer(x, y - sprite_height, "Particle", oDaze_CcWise);
dazeObj.image_angle = image_angle + 15;
dazeObj.owner = owner;
dazeObj.xMax = xMax;
dazeObj.xx = xMax;
dazeObj.stars = stars + 1;
with (dazeObj) if (stars < 4) alarm_set(0, 30);
dazeObj.dazeLen = dazeLen;

stars++;