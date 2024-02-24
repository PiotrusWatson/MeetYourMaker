extends Node

@export var death_scene: PackedScene
@export var game_scene: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func load_death():
	load_scene(death_scene)
	print("loaddeath")
	
func load_game():
	load_scene(game_scene)
func load_scene(scene):
	get_tree().change_scene_to_packed(scene)
	




func _on_reload_pressed():
	load_scene(game_scene)
