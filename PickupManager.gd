extends Area2D

signal picked_up(powerup_type)
@export var powerup_type = Global.POWERUP_INDEX.GUN
@export var powerups_end_here = 1

var useful_amount = -1
var is_powerup = false

func setup(amount):
	useful_amount = amount
# Called when the node enters the scene tree for the first time.
func _ready():
	is_powerup = powerup_type < powerups_end_here + 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.has_method("enable_function") and is_powerup:
		body.enable_function(powerup_type)
		picked_up.emit(powerup_type)
		if powerup_type == Global.POWERUP_INDEX.GUN:
			DialogueManager.show_dialogue_balloon(load("res://Dialogue/FoundItem.dialogue"))
		elif powerup_type == Global.POWERUP_INDEX.JET:
			DialogueManager.show_dialogue_balloon(load("res://Dialogue/FoundJetArm.dialogue"))
		return
	if body.has_method("handle_other_powerups"):
		if powerup_type == Global.POWERUP_INDEX.MAX_HEALTH:
			DialogueManager.show_dialogue_balloon(load("res://Dialogue/FoundMaxHealth.dialogue"))
		body.handle_other_powerups(powerup_type, useful_amount)
		picked_up.emit(powerup_type)
	
	
	
	
