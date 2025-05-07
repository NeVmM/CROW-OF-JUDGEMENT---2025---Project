if (room != rm_MainMenu && room != rm_Settings && room != rm_CreditsMessage)
// Get the camera ID and view boundaries
{
var cam = view_camera[0]; // assuming you're using view 0
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);

// Optional margin from the edge
var margin = 10;

// Set position of object to top-right corner
x = cam_x + 20 - margin; // right edge minus margin
y = cam_y + 15 - margin;       // top edge plus margin
}
else
{
x = 0;
y = -64;
}
