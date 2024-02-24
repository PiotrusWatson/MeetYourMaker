extends Node2D


@onready var player = $Player
@onready var god = $God

func _ready():
	player.dead.connect(god.load_death)

