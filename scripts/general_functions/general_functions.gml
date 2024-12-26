function controlsSetup() {
	bufferTime = 8;
	jumpKeyBuffered = 0;
	jumpKeyBufferTimer = 0;
}





function getControls() {
	// Direction Inputs
	rightKey = keyboard_check(vk_right);
	leftKey = keyboard_check(vk_left);

	// Action Inputs
	jumpKeyPressed = keyboard_check_pressed(ord("Z"));
	jumpKey = keyboard_check(ord("Z"))
	
	runKey = keyboard_check(vk_shift);
	runKey = clamp(runKey, 0, 1);
	
	// Jump key buffering
	if jumpKeyPressed {
		jumpKeyBufferTimer = bufferTime;
	}
	if jumpKeyBufferTimer > 0 {
		jumpKeyBuffered = 1;
		jumpKeyBufferTimer--;
	} else {
		jumpKeyBuffered = 0;
	}
	
}