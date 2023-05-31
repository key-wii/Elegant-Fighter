dir = LEFT;
spd = 2;
maxPushSpd = 9999;

windupMax = 70;
atk = -1;
attacking = false;
hitbox = noone;

pickerMin = 0;
pickerMax = 99;

dazeLen = 420;
dazed = false;
falling = false;
knockdown = false;

juggleCount = 0;
lastHitType = noone;

hp = 1;
broken = false;

alarm_set(4, 1);


yHigh1 = sprite_height * -1;
yHigh2 = sprite_height * -.5;
yLow1 = sprite_height * -.5;
yLow2 = 0;
xLeft1 = sprite_width * -2;
xLeft2 = sprite_width * -.5;
xRight1 = sprite_width * .5;
xRight2 = sprite_width * 2;

enemyType = oEnemy;
instance_change(enemyType, false);