// Function to set up control variables
function controlsSetup() {
    bufferTime = 8; // Time in steps for jump key buffering
    jumpKeyBuffered = 0; // Flag to indicate if the jump key is buffered
    jumpKeyBufferTimer = 0; // Timer for the jump key buffer
}

// Function to get player controls
function getControls() {
    // Direction Inputs
    rightKey = keyboard_check(vk_right); // Right movement
    leftKey = keyboard_check(vk_left); // Left movement

    // Action Inputs
    jumpKeyPressed = keyboard_check_pressed(ord("Z")); // Jump key pressed
    jumpKey = keyboard_check(ord("Z")); // Jump key held down

    runKey = keyboard_check(vk_shift); // Run key (Shift)
    runKey = clamp(runKey, 0, 1); // Ensure runKey is either 0 or 1

    attackKeyPressed = keyboard_check_pressed(ord("X")); // Attack key pressed

    // Jump key buffering
    if (jumpKeyPressed) {
        jumpKeyBufferTimer = bufferTime; // Reset the buffer timer
    }
    
    // Manage the jump key buffer
    if (jumpKeyBufferTimer > 0) {
        jumpKeyBuffered = 1; // Set the buffered jump flag
        jumpKeyBufferTimer--; // Decrease the buffer timer
    } else {
        jumpKeyBuffered = 0; // Reset the buffered jump flag
    }
}