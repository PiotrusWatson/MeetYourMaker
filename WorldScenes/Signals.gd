extends Node2D

@onready var health_bar = $CanvasLayer/HealthBar
@onready var player = $Player
@onready var god = $God

signal all_ready
func _ready():
	player.dead.connect(god.load_death)
	player.healing.connect(health_bar.set_health)
	player.max_health_increased.connect(health_bar.set_max_value)
	player.hurt.connect(health_bar.set_health)
	

