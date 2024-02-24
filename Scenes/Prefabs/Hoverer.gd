extends Node

@export var hover_strength = 5.0
@export var hover_position = Vector2.ZERO
@export var rigidbody : RigidBody2D
@export var recharge_amount = 2.0
@export var max_recharge_time = 6.0
@onready var hover_timer = $HoverTime
@onready var recharge_timer = $RechargeTimer

var recharge_time = 0
var max_time
var out_of_fuel = false
var hovering = false

func init(body):
	rigidbody = body
# Called when the node enters the scene tree for the first time.
func _ready():
	max_time = hover_timer.wait_time


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if hover_timer.is_stopped() or out_of_fuel:
		return
	rigidbody.apply_central_force(Vector2.UP * hover_strength)
	
func start_hovering():
	hovering = true
	stop_recharging()
	hover_timer.start()
func stop_hovering():
	hovering = false
	var current_time = hover_timer.time_left
	hover_timer.stop()
	hover_timer.wait_time = current_time
	
func start_recharging():
	if hovering or !recharge_timer.is_stopped:
		return
	recharge_timer.start()
	
func stop_recharging():
	recharge_timer.stop()


func _on_hover_time_timeout():
	hover_timer.wait_time = max_time
	out_of_fuel = true
	hovering = false


func _on_recharge_timer_timeout():
	if recharge_time< max_recharge_time:
		recharge_time += recharge_amount
	else:
		out_of_fuel = false
		recharge_time = 0
		stop_recharging()

	pass # Replace with function body

