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
slideSprite = sPlayerWallSlide;




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
onWall = false;


// Coyote Time
hangFrames = 4;
hangTimer = 0;

jumpFrames = 5;
jumpTimer = 0;
//attack

attackActive = false; // Flag to indicate if the attack is active
attackTimer = 0; // Timer for the attack duration
attackDuration = 8; // Duration of the attack animation in steps (adjust as needed)
attackDamage = 10; // Damage dealt by the slash attack
slashSprite = sPlayerSlash; // Your slash attack sprite
bounceForce = 60; // Force applied when bouncing off a wall