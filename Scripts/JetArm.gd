extends Node2D

@onready var hoverer = $Hoverer
@onready var arm = $ArmSegment
@onready var hand = $JetHand

var is_pushing = false
# Called when the node enters the scene tree for the first time.
func _ready():
	hoverer.init(arm)
	set_collision(false)
func activate():
	set_collision(true)
	
func set_collision(is_colliding):
	hand.set_collision_layer_value(1, is_colliding)
	hand.set_collision_layer_value(2, is_colliding)
	hand.set_collision_mask_value(1, is_colliding)
	hand.set_collision_mask_value(2, is_colliding)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if is_pushing:
		hand.apply_central_force(Vector2.DOWN)
	
func start_hover():
	is_pushing = true
	hoverer.start_hovering()
	
func stop_hover():
	is_pushing = false
	hoverer.stop_hovering()



func _on_grounded_checker_body_entered(body):
	hoverer.start_recharging()
