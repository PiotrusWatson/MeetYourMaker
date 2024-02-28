extends AudioStreamPlayer

@export var clips: Array[AudioStream]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func play_random():
	stream = clips.pick_random()
	play()
