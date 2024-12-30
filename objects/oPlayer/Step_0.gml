getControls(); // Call your input handling function

// x movement
// direction
moveDir = rightKey - leftKey;
// get face
if (moveDir != 0) {
    face = moveDir;
}
// get xspd
runType = runKey;
xspd = moveDir * moveSpeed[runType];

// Check for wall contact
if (!onGround && place_meeting(x + xspd, y, oWall)) {
    onWall = true;
} else {
    onWall = false;
}

// x collision
var _subPixel = 0.5;
if (place_meeting(x + xspd, y, oWall)) {
    // Scoot up to wall
    var _pixelCheck = _subPixel * sign(xspd);
    while (!place_meeting(x + _pixelCheck, y, oWall)) {
        x += _pixelCheck;
    }
    // Set xspd to 0 to collide
    xspd = 0;
}

// Move
x += xspd;

// y movement 
// gravity 
if (hangTimer > 0) {
    hangTimer--;
} else {
    yspd += grav;
    setOnGround(false);
}

// Jump logic
if (onGround) {
    jumpCount = 0;
    jumpTimer = jumpFrames;
} else {
    jumpTimer--;
    if (jumpCount == 0 && jumpTimer <= 0) {
        jumpCount = 1;
    }
}

// Wall jump logic
if (onWall) {
    if (jumpKeyPressed) {
        // Apply upward speed for wall jump
        yspd = -jspeed; // Set this to your desired jump speed
        jumpCount = 0; // Reset jump count

        // Change direction when hitting a wall while jumping
        xspd = (moveDir == 1) ? -moveSpeed[runType] : moveSpeed[runType]; // Push away from the wall
        xspd += (moveDir == 1) ? -bounceForce : bounceForce; // Add bounce force
    }
}

// Initiate the jump
if (jumpKeyBuffered && jumpCount < jumpMax) {
    jumpKeyBuffered = false; // Reset buffer
    jumpKeyBufferTimer = 0;
    jumpCount++;
    jumpHoldTimer = jumpHoldFrames;
    setOnGround(false);
}

if (!jumpKey) {
    jumpHoldTimer = 0;
}

if (jumpHoldTimer > 0) {
    yspd = jspeed;
    jumpHoldTimer--;
}

// y collision
if (place_meeting(x, y + yspd, oWall)) {
    var _pixelCheck = _subPixel * sign(yspd);
    while (!place_meeting(x, y + _pixelCheck, oWall)) {
        y += _pixelCheck;
    }
    yspd = 0;
}

// Set if I'm on the ground 
if (yspd >= 0 && place_meeting(x, y + 1, oWall)) {
    setOnGround(true);
}

// Attack logic


// In your attack logic
if (attackActive) {
    attackTimer++; // Increment the attack timer
    
    // Check for collisions with enemies
    var hitEnemy = instance_place(x, y, oEnemy); // Replace oEnemy with your enemy object
    if (hitEnemy != noone) {
        if (hitEnemy.health != undefined) {
            hitEnemy.health -= attackDamage; // Apply damage
        }
    }
    
    // Check if the attack animation is finished
    if (attackTimer >= attackDuration) {
        attackActive = false; // End the attack
        sprite_index = idleSprite; // Return to idle or previous sprite
    }
}

// Move
y += yspd;

// Sprite control 
if (abs(xspd) > 0) {
    sprite_index = walkSprite;
}
if (abs(xspd) >= moveSpeed[1]) {
    sprite_index = runSprite;
}
if (xspd == 0) {
    sprite_index = idleSprite;
}
if (!onGround) {
    sprite_index = jumpSprite;
}
if (onWall) {
    sprite_index = slideSprite;
}
if (attackKeyPressed && !attackActive) {
    performSlashAttack(); // Call the attack function
	sprite_index = slashSprite; // Set this to your slash attack sprite
}
mask_index = idleSprite;

// Function to handle the slash attack
function performSlashAttack() {
    // Play the attack animation
    sprite_index = slashSprite; // Set this to your slash attack sprite
    image_index = 0; // Reset the animation frame if needed
    attackActive = true; // Flag to indicate the attack is active
    attackTimer = 0; // Reset the attack timer
}