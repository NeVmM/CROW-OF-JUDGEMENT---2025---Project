xSpeed = 0;
ySpeed = 0;

facing = -1;
moveSpeed = 1.5;

hp = 50;
flash = 0;
hitfrom = 0;

move_timer = irandom_range(180, 360); // timer for random movement
is_moving = true; // starts moving

dead = false;

onGround = true;
can_attack = true;
attack_cooldown = 0;
is_attacking = false;

attack_timer = 0;
attack_effect_spawned = false;


//KNOCKBACK TEST
got_hit = false;
knockback_x = 0;
knockback_y = 0;
gravity_disabled = false; // Initialize as false