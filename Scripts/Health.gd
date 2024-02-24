extends Node2D

@export var max_health = 100
var health
signal dead
signal hurt
# Called when the node enters the scene tree for the first time.
func _ready():
	health = max_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func damage(damage):
	health -= damage
	hurt.emit()
	print(health)
	if health <= 0:
		dead.emit()
		
		
