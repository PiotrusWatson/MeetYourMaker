extends RigidBody2D

@onready var movement = $Mover
@onready var jump_handler = $JumpHandler
@onready var spring_animator = $Spring
@onready var health = $Health
@onready var arm_joint = $GunArm
var horizontal = 0
var mouse_pos

signal dead
signal hurt(health)


func _ready():
	movement.init(self)
	jump_handler.init(self)


	
	
func _input(event):
	if event.is_action_pressed("Jump"):
		charge_jump()
	elif event.is_action_released("Jump"):
		jump()
# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	horizontal = Input.get_axis("Left", "Right")
	arm_joint.rotate_towards_point(get_global_mouse_position(), delta)

func _physics_process(deltPinJoint2Da):
	movement.move_player(Vector2(horizontal, 0))

func player():
	pass


func charge_jump():
	spring_animator.visible = true
	spring_animator.play("coiled")
	jump_handler.charge_jump()
	
func jump():
	spring_animator.play("uncoil")
	jump_handler.jump()
	
func damage(damage):
	health.damage(damage)
	
func _on_spring_animation_finished():
	spring_animator.visible = false


func _on_health_dead():
	dead.emit()


func _on_health_hurt(health):
	hurt.emit(health)
