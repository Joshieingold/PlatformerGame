// get inputs
rightKey = keyboard_check(vk_right);
leftKey = keyboard_check(vk_left);


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