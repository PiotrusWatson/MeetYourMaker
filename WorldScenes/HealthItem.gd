extends Node2D

signal picked_up(powerup_type)
@export var amount_to_heal = 30
@onready var pickup_manager = $PickupManager
# Called when the node enters the scene tree for the first time.
func _ready():
	pickup_manager.setup(amount_to_heal)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pickup_manager_picked_up(powerup_type):
	picked_up.emit(powerup_type)
	queue_free()
