#region Gravity
var grav = 0.5;
ySpeed += grav;
ySpeed = clamp(ySpeed, -10, 10);
#endregion

#region Turn Around On Wall Collision
if (place_meeting(x + moveSpeed * facing, y, eObject1))
{
    facing *= -1;
}
#endregion

#region Horizontal Movement
xSpeed = moveSpeed * facing;
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
var checkX = x + facing;
var checkY = y + 1;

if (!position_meeting(checkX, checkY, eObject1))
{
    facing *= -1; // Turn around at ledge
}
#endregion

#region Follow Player & Attack
var _player = instance_nearest(x, y, oCrow);

if (instance_exists(_player))
{
    var dist_x = _player.x - x;
    var dist_y = abs(_player.y - y);

    // Check if player is within detection range
    if (abs(dist_x) < 160 && dist_y < 16) 
    {
        // Only turn if the player is a bit far to avoid flickering
        if (abs(dist_x) > 32) 
        {
            facing = (dist_x < 0) ? -1 : 1;
        }

        if (!is_attacking && attack_cooldown <= 0)
        {
            // Begin attack
            is_attacking = true;
            attack_effect_spawned = false;
            sprite_index = Sprite_EnemySkelly_Attack;
            image_index = 0;
            image_speed = 1.5;
        }
    }
}
#endregion

#region Handle Attack Animation and Spawn Effect
if (is_attacking)
{
    if (!attack_effect_spawned && image_index >= 1)
    {
        var effect_x = x + (facing * 16);
        var effect_y = y;
        var fx = instance_create_layer(effect_x, effect_y, layer, oEnemySkellyAtkFX);
        fx.owner = id;
        fx.facing = facing;
        attack_effect_spawned = true;
    }

    if (image_index >= image_number - 1)
    {
        is_attacking = false;
        attack_cooldown = irandom_range(room_speed * 0.8, room_speed * 1.7);
    }
}
#endregion

//#region Walking Sound Logic
//var _player = instance_nearest(x, y, oCrow);
//var dist = point_distance(x, y, _player.x, _player.y); // Calculate distance to player

//if (dist < 500)  // Check if player is within range (adjust distance as needed)
//{
//    if (xSpeed != 0 && !is_attacking) // If moving and not attacking
//    {
//        if (!audio_is_playing(SkeletonWalking)) // Play sound if not already playing
//        {
//            audio_play_sound(SkeletonWalking, 10, true); // Play sound in loop
//        }
//    }
//    else
//    {
//        if (audio_is_playing(SkeletonWalking)) // Stop sound when idle
//        {
//            audio_stop_sound(SkeletonWalking); // Stop walking sound
//        }
//    }
//}
//else
//{
//    if (audio_is_playing(SkeletonWalking)) // Stop sound if player is out of range
//    {
//        audio_stop_sound(SkeletonWalking); // Stop walking sound
//    }
//}
//#endregion









//OTHER STUFF
#region Sprites
if (!is_attacking)
{
    sprite_index = Sprite_EnemySkelly_Walking;
}
image_xscale = facing;

// Cooldown timer
if (attack_cooldown > 0)
{
    attack_cooldown--;
}
#endregion 
