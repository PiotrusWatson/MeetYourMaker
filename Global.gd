extends Node


var max_lives = 100
var lives = max_lives
var hud
var player_current_attack = false

func lose_life():
	lives -= 12.5
	hud.load_hearts()
	
	print(Global.lives)
