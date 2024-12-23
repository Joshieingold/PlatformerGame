// get inputs
rightKey = keyboard_check(vk_right);
leftKey = keyboard_check(vk_left);
jumpKeyPressed = keyboard_check_pressed( vk_space);



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
	yspd += grav;
	if yspd > termVel {yspd = termVel;};
	
	// jump 
	if jumpKeyPressed && place_meeting(x, y + 1,  oWall) {
		yspd = jspeed;
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
	// move
	y+= yspd;


















