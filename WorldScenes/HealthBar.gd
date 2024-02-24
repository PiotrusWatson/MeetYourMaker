extends ProgressBar

var player_health

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	max_value = $"../../../Player".health.max_health 
	player_health = $"../../../Player".health.health 
	value = player_health



