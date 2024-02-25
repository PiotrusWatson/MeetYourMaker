extends Node2D

@export var thingToSpawn : PackedScene
@export var max_spawns = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func spawn():
	if get_child_count() - 2 > max_spawns:
		return
	var spawned_thing = thingToSpawn.instantiate()
	add_child(spawned_thing)
	spawned_thing.global_position = global_position


func _on_timer_timeout():
	spawn()
