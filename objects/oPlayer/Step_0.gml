
getControls();


// x movement
	//direction
	moveDir = rightKey - leftKey ;

	// get xspd
	xspd = moveDir * moveSpeed;


	// x collision
	var _subPixel = .5;
	if place_meeting(x + xspd, y, oWall) 
	{
		// scoot up to wall
		var _pixelCheck = _subPixel * sign(xspd);
		while !place_meeting(x+ _pixelCheck, y, oWall) {
			x+= _pixelCheck;
		}
	
		//set xspd to 0 to collide
		xspd = 0;
		}
	//move
	x += xspd;
	
// y movement 
	//gravity 
	if hangTimer > 0 {
		hangTimer--;
	}
	else {
		yspd += grav;
		setOnGround(false);
	}

	
	
	// jump 
	if onGround {
			jumpCount = 0;
			jumpTimer = jumpFrames;
	} else {
		jumpTimer--;
		if jumpCount == 0 && jumpTimer <= 0 { jumpCount = 1;};
	
	};
		
	// initiate the jump
	if jumpKeyBuffered && jumpCount < jumpMax {
		// reset buffer
		jumpKeyBuffered = false;
		jumpKeyBufferTimer = 0;
		
		jumpCount++

		// set the jum hold timer
		jumpHoldTimer = jumpHoldFrames;
		setOnGround(false);
		
	}
	if !jumpKey {
		jumpHoldTimer = 0;
	}
	
	
	if jumpHoldTimer > 0 {
		yspd = jspeed;
		jumpHoldTimer--;
	}
	
	
	
	
	//y collision
	var _subPixel = .5;
	if place_meeting(x, y + yspd, oWall) {
		var _pixelCheck = _subPixel * sign(yspd);
		while !place_meeting(x, y + _pixelCheck, oWall) {
			y += _pixelCheck;
		}
		
		yspd = 0;
	}
	// set if im on the ground 
	if yspd >= 0 && place_meeting(x, y+1, oWall) {
		
		setOnGround(true);
	}
	
	
	// move
	y+= yspd;


















