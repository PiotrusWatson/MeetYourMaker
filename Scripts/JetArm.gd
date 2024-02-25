extends Node2D

@onready var hoverer = $Hoverer
@onready var arm = $ArmSegment
@onready var hand = $JetHand

var is_pushing = false
# Called when the node enters the scene tree for the first time.
func _ready():
	hoverer.init(arm)


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
