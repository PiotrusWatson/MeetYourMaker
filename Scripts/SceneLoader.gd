extends Node

var death_scene = load("res://WorldScenes/death_scene.tscn")
var game_scene = load("res://WorldScenes/RealWorld.tscn")
var opening_scene = load("res://WorldScenes/dialogue_scene.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	if get_tree().current_scene.name == "MainMenu":
		MusicPlayer.play_track(0)
	elif get_tree().current_scene.name == "World":
		MusicPlayer.play_track(1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func load_death():
	load_scene(death_scene)
	
func load_game():
	load_scene(game_scene)
	
func load_scene(scene):
	get_tree().change_scene_to_packed(scene)
	




func _on_reload_pressed():
	load_scene(game_scene)


func _on_button_pressed():
	load_scene(opening_scene)
