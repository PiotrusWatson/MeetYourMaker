extends Control


func _ready():
	DialogueManager.dialogue_ended.connect(go_to_game)
	DialogueManager.show_dialogue_balloon(load("res://Dialogue/IntroCrawl.dialogue"))


func go_to_game(stuff):
	print("GOING TO GAME")
	get_tree().change_scene_to_packed(load("res://WorldScenes/RealWorld.tscn"))
