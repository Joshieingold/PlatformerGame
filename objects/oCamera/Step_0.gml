// Fullscreen toggle
if keyboard_check_pressed(vk_f11) {
	window_set_fullscreen( !window_get_fullscreen() );
}


// exit if there is not player
if !instance_exists(oPlayer) exit;


//get camera size
var _camWidth = camera_get_view_width(view_camera[0]);
var _camHeight = camera_get_view_height(view_camera[0]);

// get camera target cords
var _camX = oPlayer.x - _camWidth/2;
var _camY = oPlayer.y - _camHeight/2;

// contrain cam to room borders

_camX = clamp(_camX, 0, room_width - _camWidth);
_camY = clamp(_camY, 0, room_height - _camHeight);

//set cam cord variables
finalCamX = (_camX - finalCamX) * camTrailSpeed;
finalCamY = (_camY - finalCamY) * camTrailSpeed;


// set camera cords
camera_set_view_pos(view_camera[0], _camX, _camY);