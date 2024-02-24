extends Node2D

@export var projectile_prefab: PackedScene
@export var target_location: Node2D
@onready var projectile_box = $ProjectileBox
@onready var cooldown_timer = $Cooldown
var gun_owner : RigidBody2D

func init(parent):
	gun_owner = parent
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func player():
		pass

func shoot():
	if !cooldown_timer.is_stopped():
		return
	var projectile = projectile_prefab.instantiate()
	projectile_box.add_child(projectile)
	projectile.global_position = target_location.global_position
	projectile.global_rotation = target_location.global_rotation
	
	if projectile.has_method("setup"):
		projectile.setup(gun_owner)
	cooldown_timer.start()
	
	

