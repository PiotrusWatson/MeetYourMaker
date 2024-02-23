extends RigidBody2D

@onready var movement = $Mover
@onready var jump_handler = $JumpHandler
@onready var spring_animator = $Spring
var horizontal = 0


func charge_jump():
	spring_animator.visible = true
	spring_animator.play("coiled")
	jump_handler.charge_jump()
	
func jump():
	spring_animator.play("uncoil")
	jump_handler.jump()
	
	
func _input(event):
	if event.is_action_pressed("Jump"):
		charge_jump()
	elif event.is_action_released("Jump"):
		jump()
# Called when the node enters the scene tree for the first time.
func _ready():
	movement.init(self)
	jump_handler.init(self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	horizontal = Input.get_axis("Left", "Right")

func _physics_process(delta):
	movement.move_player(Vector2(horizontal, 0))


func _on_spring_animation_finished():
	spring_animator.visible = false
