extends Node

var in_menu = false
var max_lives = 100
var lives = max_lives
var hud
var player_current_attack = false
enum POWERUP_INDEX{GUN = 0, JET = 1, HEALTH = 2, MAX_HEALTH = 3}

func lose_life():
	lives -= 12.5
	hud.load_hearts()
	
	print(Global.lives)
