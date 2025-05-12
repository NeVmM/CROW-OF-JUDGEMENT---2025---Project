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
    move_timer = irandom_range(180, 420); // random delay before next toggle
	
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
	sprite_index = Sprite_EnemyFairy_Idle;
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

// --- FLIP SPRITE BASED ON FACING DIRECTION ---
if (is_moving) 
{
    image_xscale = facing;
}

#endregion

#region Ledge Detection (floor)

// Look 1 pixel ahead in facing direction, and 1 pixel below that
var checkX = x + 0.1;
var checkY = y + 0.1;

if (!position_meeting(checkX, checkY, eObject1)) {
    facing *= -1; // Turn around at ledge
}

#endregion

#region Follow Player
var _player = instance_nearest(x, y, oCrow);
is_following_player = false;

if (instance_exists(_player))
{
    var dist_x = _player.x - x;
    var dist_y = abs(_player.y - y);

    // Check if player is within detection range
    if (abs(dist_x) < 160 && dist_y < 16) // Within detection range
    {
        is_following_player = true;

        // Face the player
        facing = (dist_x < 0) ? -1 : 1;

        // Move towards the player
        if (abs(dist_x) > 8) // Add a small buffer to prevent "twitching"
        {
            x += facing * moveSpeed;
			
				audio_play_sound(FairyChaseSFX, 10, false);
				audio_sound_gain(FairyChaseSFX, 0.5, 0); // Optional: Set volume
	
        }
		
		
    }
}
#endregion











 if (just_hit > 0)
{
    just_hit--;
}

 
 
 
 
 
 
 


// OTHER STUFF BELOW
#region Sprites Etc
if (is_moving) 
{
    sprite_index = Sprite_EnemyFairy_Walking;
} 
else 
{
    sprite_index = Sprite_EnemyFairy_Idle;
}
#endregion


