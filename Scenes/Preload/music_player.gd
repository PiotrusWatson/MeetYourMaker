extends AudioStreamPlayer

@export var songs: Array[AudioStream]
# Called when the node enters the scene tree for the first time.
func _ready():
	play_track(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func play_track(index):
	if index >= len(songs):
		return
	stream = songs[index]
	play()


