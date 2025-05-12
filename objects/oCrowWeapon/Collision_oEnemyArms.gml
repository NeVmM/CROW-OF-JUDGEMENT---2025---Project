// In the collision detection between weapon and enemy
with(other) {
    hp--;  // or apply your damage method
    flash = 1.5;
    hitfrom = other.direction;

    // Set knockback based on the direction of the attack
    knockback_x = -sign(other.x - x) * 3;  // Apply knockback opposite of where the attack came from
    knockback_y = -2;  // Small vertical knockback (you can adjust this)

    // Set flag that the enemy got hit
    got_hit = true;
}