#region Camera Stuff

//Fullscreen toggle
if keyboard_check_pressed(vk_f8)
{
	window_set_fullscreen(!window_get_fullscreen());
}
// === 0. Fullscreen toggle ===
if keyboard_check_pressed(vk_f11) {
    window_set_fullscreen(!window_get_fullscreen());
}

// === 1. Exit if no player ===
if !instance_exists(oCrow) exit;

// === 2. Get camera size ===
var _camWidth = camera_get_view_width(view_camera[0]);
var _camHeight = camera_get_view_height(view_camera[0]);

// === 3. Input & vertical movement offset ===

camOffsetX = 0;
camOffsetY = 0;

var inputX = 0;
var inputY = 0;

// Detect movement key input
if keyboard_check(vk_left)  or keyboard_check(ord("A")) inputX -= 1;
if keyboard_check(vk_right) or keyboard_check(ord("D")) inputX += 1;
if keyboard_check(vk_up)    or keyboard_check(ord("W")) inputY -= 1;
if keyboard_check(vk_down)  or keyboard_check(ord("S")) inputY += 1;

var pressingInput = (inputX != 0) || (inputY != 0);

// Use input-based offset if pressing keys
if (pressingInput) {
    camOffsetX = inputX * camOffsetDist;
    camOffsetY = inputY * camOffsetDist;
}
else {
    // Pan down and follow faster when falling
    if (oCrow.vspeed > 0.5) {
        var fall_speed = clamp(oCrow.vspeed, 0, 16); // Cap fall effect
        camOffsetY = fall_speed * 6; // Adjust for pan distance

        camTrailSpd_dynamic = 0.18; // Follow faster while falling
    }
    else if (oCrow.vspeed < -0.5) {
        camOffsetY = camJumpOffset;
        camTrailSpd_dynamic = camTrailSpd; // Normal speed while rising
    }
    else {
        camTrailSpd_dynamic = camTrailSpd; // Reset to default
    }
}

// === 4. Smooth offset movement ===
var offsetSmoothFactor = camOffsetSmooth;

camOffsetX_final += (camOffsetX - camOffsetX_final) * offsetSmoothFactor;
camOffsetY_final += (camOffsetY - camOffsetY_final) * offsetSmoothFactor;

// === 5. Camera target centered on player + offset
var _camX = oCrow.x - _camWidth / 2 + camOffsetX_final;
var _camY = oCrow.y - _camHeight / 2 + camOffsetY_final + camVerticalBias;

// Clamp camera inside room
_camX = clamp(_camX, 0, room_width - _camWidth);
_camY = clamp(_camY, 0, room_height - _camHeight);

// === 6. Smoothly move camera towards target
finalCamX += (_camX - finalCamX) * camTrailSpd_dynamic;
finalCamY += (_camY - finalCamY) * camTrailSpd_dynamic;

// === 7. Apply camera position
camera_set_view_pos(view_camera[0], finalCamX, finalCamY);

#endregion;


if (shake_timer > 0) {
    shake_timer--;
    var shake_x = random_range(-shake_amount, shake_amount);
    var shake_y = random_range(-shake_amount, shake_amount);
    camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + shake_x, camera_get_view_y(view_camera[0]) + shake_y);
}










// PARALLAX OUTPUT below  ==============================================================


#region camera position & stuff

// Get camera position
var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);

// Adjust this value for parallax depth (e.g., 0.5 = half speed)
var parallaxFactor = 0.5;

// Calculate how far the camera has moved horizontally
var parallaxX = camX * parallaxFactor;

#endregion

#region FOREST PARALLAX

// Position the parallax layer relative to the camera view
if (layer_exists("mountains")) 
{
	var parallaxX_mountains = camX * 0.7; // Moves at 50% of camera
    var offsetY_mountains = 50;           // Optional Y offset
    layer_x("mountains", camX + (parallaxX_mountains - camX)); // Lock the background’s top-left corner to the camera view
    layer_y("mountains", camY + offsetY_mountains); // Lock vertically with the camera
}
	
if (layer_exists("outer_tree")) 
{
	var parallaxX_outer_tree = camX * 0.6; // Moves at 50% of camera
    var offsetY_outer_tree = 30;           // Optional Y offset
    layer_x("outer_tree", camX + (parallaxX_outer_tree - camX)); // Lock the background’s top-left corner to the camera view
    layer_y("outer_tree", camY + offsetY_outer_tree); // Lock vertically with the camera
}

if (layer_exists("inner_tree")) 
{
	var parallaxX_inner_tree = camX * 0.4; // Moves at 50% of camera
    var offsetY_inner_tree = 10;           // Optional Y offset
    layer_x("inner_tree", camX + (parallaxX_inner_tree - camX)); // Lock the background’s top-left corner to the camera view
    layer_y("inner_tree", camY + offsetY_inner_tree); // Lock vertically with the camera
}




// At the top of the object, define scroll offsets
if (!variable_global_exists("cloud_scroll_outer")) global.cloud_scroll_outer = 0;
if (!variable_global_exists("cloud_scroll_inner")) global.cloud_scroll_inner = 0;


// === CLOUDS (Independent scrolling) ===
if (!variable_global_exists("cloud_scroll_outer")) global.cloud_scroll_outer = 0;
if (!variable_global_exists("cloud_scroll_inner")) global.cloud_scroll_inner = 0;

// Move the clouds continuously
global.cloud_scroll_outer += 0.05; // Adjust speed
global.cloud_scroll_inner += 0.025;

// Wrap if they scroll too far (optional)
if (global.cloud_scroll_outer > 10000) global.cloud_scroll_outer = 0;
if (global.cloud_scroll_inner > 10000) global.cloud_scroll_inner = 0;

// Apply to cloud layers
if (layer_exists("outer_cloud")) 
{
    var offsetY_outer_cloud = 30;
    layer_x("outer_cloud", global.cloud_scroll_outer);
    layer_y("outer_cloud", camY + offsetY_outer_cloud);
}

if (layer_exists("inner_cloud")) 
{
    var offsetY_inner_cloud = 30;
    layer_x("inner_cloud", global.cloud_scroll_inner);
    layer_y("inner_cloud", camY + offsetY_inner_cloud);
}

#endregion

#region HEAVENS PARALLAX

if (layer_exists("outer_cloud")) 
{
	var parallaxX_outer_cloud = camX * 0.7; // Moves at 50% of camera
    var offsetY_outer_cloud = 10;           // Optional Y offset
    layer_x("outer_cloud", camX + (parallaxX_outer_cloud - camX)); // Lock the background’s top-left corner to the camera view
    layer_y("outer_cloud", camY + offsetY_outer_cloud); // Lock vertically with the camera
}

if (layer_exists("inner_cloud")) 
{
	var parallaxX_inner_cloud = camX * 0.6; // Moves at 50% of camera
    var offsetY_inner_cloud = 10;           // Optional Y offset
    layer_x("inner_cloud", camX + (parallaxX_inner_cloud - camX)); // Lock the background’s top-left corner to the camera view
    layer_y("inner_cloud", camY + offsetY_inner_cloud); // Lock vertically with the camera
}

if (layer_exists("outer_mountain")) 
{
	var parallaxX_outer_mountain = camX * 0.5; // Moves at 50% of camera
    var offsetY_outer_mountain = 10;           // Optional Y offset
    layer_x("outer_mountain", camX + (parallaxX_outer_mountain - camX)); // Lock the background’s top-left corner to the camera view
    layer_y("outer_mountain", camY + offsetY_outer_mountain); // Lock vertically with the camera
}

if (layer_exists("inner_mountain")) 
{
	var parallaxX_inner_mountain = camX * 0.4; // Moves at 50% of camera
    var offsetY_inner_mountain = 10;           // Optional Y offset
    layer_x("inner_mountain", camX + (parallaxX_inner_mountain - camX)); // Lock the background’s top-left corner to the camera view
    layer_y("inner_mountain", camY + offsetY_inner_mountain); // Lock vertically with the camera
}

if (layer_exists("debris")) 
{
	var parallaxX_debris = camX * 0.3; // Moves at 50% of camera
    var offsetY_debris = 10;           // Optional Y offset
    layer_x("debris", camX + (parallaxX_debris - camX)); // Lock the background’s top-left corner to the camera view
    layer_y("debris", camY + offsetY_debris); // Lock vertically with the camera
}

if (layer_exists("tree")) 
{
	var parallaxX_tree = camX * 0.2; // Moves at 50% of camera
    var offsetY_tree = 10;           // Optional Y offset
    layer_x("tree", camX + (parallaxX_tree - camX)); // Lock the background’s top-left corner to the camera view
    layer_y("tree", camY + offsetY_tree); // Lock vertically with the camera
}

#endregion