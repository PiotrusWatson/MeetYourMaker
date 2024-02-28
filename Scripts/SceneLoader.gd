extends Node

var death_scene = load("res://WorldScenes/death_scene.tscn")
var game_scene = load("res://WorldScenes/RealWorld.tscn")
var opening_scene = load("res://WorldScenes/dialogue_scene.tscn")
var menu_scene = load("res://WorldScenes/MainMenu.tscn")
var credits_scene = load("res://WorldScenes/credits.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	if get_tree().current_scene.name == "MainMenu" and !Global.in_menu:
		MusicPlayer.play_track(0)
		Global.in_menu = true
	elif get_tree().current_scene.name == "World":
		MusicPlayer.play_track(1)
		Global.in_menu = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func load_death():
	load_scene(death_scene)
	
func load_game():
	load_scene(game_scene)
	
func load_scene(scene):
	get_tree().change_scene_to_packed(scene)
	
func exit():
	get_tree().quit()


func _on_reload_pressed():
	load_scene(game_scene)


func _on_button_pressed():
	load_scene(opening_scene)


func _on_return_pressed():
	load_scene(menu_scene)


func _on_credits_pressed():
	load_scene(credits_scene)


func _on_quit_pressed():
	exit()
