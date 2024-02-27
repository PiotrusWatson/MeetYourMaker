extends Node2D

@onready var health_bar = $HUD/HealthBar
@onready var player = $Player
@onready var god = $God

signal all_ready
func _ready():
	player.dead.connect(god.load_death)
	player.healing.connect(health_bar.set_health)
	player.max_health_increased.connect(health_bar.set_max_value)
	player.hurt.connect(health_bar.set_health)
	DialogueManager.passed_title.connect(player.disallow_to_move)
	DialogueManager.dialogue_ended.connect(player.make_allowed_to_move)	

