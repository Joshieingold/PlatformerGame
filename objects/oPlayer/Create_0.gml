// Player Functions
function setOnGround(_val = true) {
	if _val == true {
		onGround = true;
		hangTimer = hangFrames;
	} else {
		onGround = false;
		hangTimer = 0;
	}
	
}


// Control setup
controlsSetup();

// sprites 
idleSprite = sPlayerIdle;
walkSprite = sPlayerWalk;
runSprite = sPlayerRun;
jumpSprite = sPlayerJump;


//Moving
face = 1;
moverDir = 0;
runType = 0;
moveSpeed[0] = 2;
moveSpeed[1] = 3.5
xspd = 0;
yspd = 0;


// Jumping
grav = 0.275;
termVel = 4;
jspeed = -3.15;
jumpMax = 2;
jumpCount = 0;
jumpHoldTimer = 0;
jumpHoldFrames = 14;
onGround = true;

// Coyote Time
hangFrames = 4;
hangTimer = 0;

jumpFrames = 5;
jumpTimer = 0;
