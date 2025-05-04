// Game End event of obj_GameController
ini_open("save.ini");

// Save player data from global variables
ini_write_real("Player", "x", global.player_x);
ini_write_real("Player", "y", global.player_y);
ini_write_real("Player", "hp", global.player_hp);
ini_write_real("Player", "points", global.player_points);

// Save instances of enemies or other objects
var i = 0;
with (all) {
    // Save only instances of objects that are enemies (e.g., oEnemy)
    if (object_is_ancestor(object_index, oEnemyArms)) {
        ini_write_real("Enemy_" + string(i), "x", x);
        ini_write_real("Enemy_" + string(i), "y", y);
        ini_write_real("Enemy_" + string(i), "hp", hp);
        i++;
    }
}
ini_write_real("Enemy", "count", i);

ini_close();
