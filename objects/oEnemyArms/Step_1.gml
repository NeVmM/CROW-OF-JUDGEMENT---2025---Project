if (hp <= 0 && !dead)
{
	dead = true;
	
	audio_play_sound(ArmsDead, 10, false);
	audio_sound_gain(ArmsDead, 1.5, 0); // Optional volume
	
	with(instance_create_layer(x,y,layer,oEnemyArmsDead))
	{
		direction = other.hitfrom;
		xSpeed = lengthdir_x(3, direction);
		ySpeed = lengthdir_y(3, direction);
		
		oPoints.points += 50;
	}
	
	instance_destroy();
}