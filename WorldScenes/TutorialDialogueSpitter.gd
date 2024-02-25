extends Timer


@export var seen_before = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timeout():
	if seen_before:
		return
	DialogueManager.show_dialogue_balloon(load("res://Dialogue/ControlExplanation.dialogue"))

