extends Node2D

@export var max_health = 100
var health
signal dead
signal hurt(health)
signal healing(health)
signal max_health_increase(health)


# Called when the node enters the scene tree for the first time.
func _ready():
	health = max_health
	await get_tree().create_timer(1.0).timeout
	print("hey lol")
	healing.emit(health)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func increase_max_health(amount):
	max_health += amount
	health = max_health
	max_health_increase.emit(max_health)
	
func heal(amount):
	if health + amount > max_health:
		health = max_health
	else:
		health += amount
	healing.emit(health)
		
func damage(damage):
	health -= damage
	hurt.emit(health)
	print(health)
	if health <= 0:
		dead.emit()
		print("dead")
		
		
