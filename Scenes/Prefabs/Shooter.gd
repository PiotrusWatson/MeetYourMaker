extends Node2D

@export var projectile_prefab: PackedScene
@export var target_location: Node2D
@onready var projectile_box = $ProjectileBox
@onready var cooldown_timer = $Cooldown

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func shoot():
	var projectile = projectile_prefab.instantiate()
	projectile_box.add_child(projectile)
	
	

