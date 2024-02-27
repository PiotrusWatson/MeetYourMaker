extends ProgressBar

var player_health

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#max_value = get_tree().get_first_node_in_group("player").health.max_health 
	#player_health = get_tree().get_first_node_in_group("player").health.health 
	#value = player_health

func set_health(health):
	value = health
	
func set_max_value(health):
	max_value = health
	value = health

