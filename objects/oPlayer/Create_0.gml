state = PlayerStateFree;
stateAttack = AttackSlash;
hitByAttack = -1;
lastState = state;

collisionMap = layer_tilemap_get_id(layer_get_id("Col"));	

image_speed = 0;
hSpeed = 0;
vSpeed = 0;
speedWalk = 2.0; //2 pixels per frame
speedRoll = 3.0;
speedBonk = 1.5;
speedHook = 3.0;

distanceRoll = 52;
distanceBonk = 40;
distanceBonkHeight = 12;
distanceHook = 88;

z = 0;
invulnerable = 0;
flash = 0;
flashShader = shWhiteFlash;
animationEndScript = -1;
spriteRoll = sPlayerRoll;
//mine
activatePos = 1;
//seek this one in the function script
hook = 0;
hookX = 0;
hookY = 0;
hookSize = sprite_get_width(sHookChain);

if (global.iLifted == noone) {
	spriteRun = sPlayerRun;
	spriteIdle = sPlayer;
} else {
	spriteIdle = sPlayerCarrying;
	spriteRun = sPlayerRunCarrying;
	sprite_index = spriteIdle;
}

localFrame = 0;


// Set the position of player when create again (move room)
if ((global.targetX) != -1 || (global.targetY) != -1 )
{
	x = global.targetX;
	y = global.targetY;
	direction = global.targetDirection;
}