extends Node

var death_scene = load("res://WorldScenes/death_scene.tscn")
var game_scene = load("res://WorldScenes/RealWorld.tscn")
var intro_scene = load("res://WorldScenes/dialogue_scene.tscn")
var end_scene = load("res://end_scene.gd")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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
	$MainMenuMusic.stop()
	load_scene(intro_scene)


func _on_end_trigger_body_entered(body):
	if body.has_method("player"):
		load_scene(end_scene)
		
