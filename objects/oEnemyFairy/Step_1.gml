if (hp <= 0 && !dead)
{
	dead = true;
	
	with(instance_create_layer(x,y,layer,oEnemyFairyDead))
	{
		direction = other.hitfrom;
		xSpeed = lengthdir_x(3, direction);
		ySpeed = lengthdir_y(3, direction);
		
		oPoints.points += 15;
	}
	
	instance_destroy();
}