extends RigidBody2D

@onready var movement = $Mover
@onready var jump_handler = $JumpHandler
@onready var spring_animator = $Spring
@onready var health = $Health
@onready var arm_joint = $GunArm
@onready var jet_arm = $JetArm
@export var death_y_zone = 1500
var horizontal = 0
var mouse_pos
var powerup_list
var enabled_list = [false, false]
var allowed_to_move = true
signal dead
signal hurt(health)
signal healing(health)
signal max_health_increased(health)



func _ready():
	movement.init(self)
	jump_handler.init(self)
	arm_joint.init(self)
	powerup_list = [arm_joint, jet_arm]
	for i in range(len(powerup_list)):
		powerup_list[i].visible = enabled_list[i]
	
	

func handle_other_powerups(index: Global.POWERUP_INDEX, useful_amount):
	if index == Global.POWERUP_INDEX.HEALTH:
		heal(useful_amount)
	elif index == Global.POWERUP_INDEX.MAX_HEALTH:
		health.increase_max_health(useful_amount)
	
func enable_function(index: Global.POWERUP_INDEX):
	enabled_list[index] = true
	powerup_list[index].visible = true

func heal(amount):
	health.heal(amount)
	
	
	
func _unhandled_input(event):
	if event.is_action_pressed("Jump"):
		charge_jump()
	elif event.is_action_released("Jump"):
		jump()
		
	if event.is_action_pressed("Hover") and enabled_list[Global.POWERUP_INDEX.JET]:
		jet_arm.start_hover()
	elif event.is_action_released("Hover") and enabled_list[Global.POWERUP_INDEX.JET]:
		jet_arm.stop_hover()
		
	if event.is_action_pressed("Shoot") and enabled_list[Global.POWERUP_INDEX.GUN]:
		arm_joint.shoot()
# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !allowed_to_move:
		return
	horizontal = Input.get_axis("Left", "Right")
	arm_joint.rotate_towards_point(get_global_mouse_position())
	if global_position.y > death_y_zone:
		_on_health_dead()

func _physics_process(delta):
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
	$DamagedSound.play()
	health.damage(damage)
	
	
func _on_spring_animation_finished():
	spring_animator.visible = false


func _on_health_dead():
	dead.emit()
	$DeathSound.play()
	await $DeathSound.finished
	


func _on_health_hurt(health):
	hurt.emit(health)


func _on_health_healing(health):
	healing.emit(health)


func _on_health_max_health_increase(health):
	max_health_increased.emit(health)

func make_allowed_to_move(stuff):
	allowed_to_move = true
func disallow_to_move(stuff):
	allowed_to_move = false
