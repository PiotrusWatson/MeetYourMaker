extends Area2D

signal picked_up(powerup_type)
@export var powerup_type = Global.POWERUP_INDEX.GUN
var is_powerup = false
# Called when the node enters the scene tree for the first time.
func _ready():
	is_powerup = powerup_type < 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.has_method("enable_function") and is_powerup:
		body.enable_function(powerup_type)
		picked_up.emit(powerup_type)
		return
	
	
