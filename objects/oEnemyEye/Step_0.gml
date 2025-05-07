#region Gravity
var grav = 0.5;
ySpeed += grav;
ySpeed = clamp(ySpeed, -10, 10);
#endregion

#region Turn Around On Wall Collision
if (is_moving && place_meeting(x + moveSpeed * facing, y, eObject1))
{
    facing *= -1;
}
#endregion

#region Random Walk & Random Timer Idle
move_timer -= 1;

if (move_timer <= 0)
{
    is_moving = !is_moving; // toggle between moving and stopping
    move_timer = irandom_range(180, 420);
    
    // Randomly flip direction when going idle
    if (!is_moving)
    {
        facing = choose(1, -1);
    }
}
#endregion

#region Horizontal Movement
if (is_moving) 
{
    xSpeed = moveSpeed * facing;
} 
else 
{
    xSpeed = 0;
}
#endregion

#region Horizontal Collision
if (place_meeting(x + xSpeed, y, eObject1))
{
    while (!place_meeting(x + sign(xSpeed), y, eObject1))
    {
        x += sign(xSpeed);
    }
    xSpeed = 0;
}
x += xSpeed;
#endregion

#region Vertical Collision
if (place_meeting(x, y + ySpeed, eObject1))
{
    while (!place_meeting(x, y + sign(ySpeed), eObject1))
    {
        y += sign(ySpeed);
    }
    ySpeed = 0;
}
y += ySpeed;
#endregion

#region Ledge Detection (floor)
// Check a bit further ahead to prevent constant flipping at the edge
var checkX = x + facing * 8; // Check a bit further ahead
var checkY = y + 1;

if (!position_meeting(checkX, checkY, eObject1) && is_moving) 
{
    facing *= -1;
}
#endregion

// --- OTHER STUFF BELOW ---
#region Sprites Etc
if (is_moving) 
{
    sprite_index = Sprite_EnemyEye_Walking;
    image_xscale = facing;
} 
else 
{
    sprite_index = Sprite_EnemyEye_Idle;
}
#endregion
