extends RigidBody2D

@onready var movement = $Mover
@onready var jump_handler = $JumpHandler
@onready var spring_animator = $Spring
@onready var health = $Health
@onready var arm_joint = $GunArm
@onready var jet_arm = $JetArm
@onready var rotator = $Rotator


@onready var roll_sound = $Sounds/PlayerRoll
@onready var jump_sound = $Sounds/JumpSound
@onready var death_sound = $Sounds/DeathSound
@onready var landing_sound = $Sounds/LandingSound
@onready var damaged_sound = $Sounds/DamagedSounds
@onready var pickup_sound = $Sounds/PowerupPickupSound

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
	rotator.init(self)
	powerup_list = [arm_joint, jet_arm]
	for i in range(len(powerup_list)):
		powerup_list[i].visible = enabled_list[i]
	
	

func handle_other_powerups(index: Global.POWERUP_INDEX, useful_amount):
	if index == Global.POWERUP_INDEX.HEALTH:
		heal(useful_amount)
	elif index == Global.POWERUP_INDEX.MAX_HEALTH:
		health.increase_max_health(useful_amount)
	
func enable_function(index: Global.POWERUP_INDEX):
	pickup_sound.play()
	enabled_list[index] = true
	powerup_list[index].visible = true
	powerup_list[index].activate()
	for powerup_enabled in enabled_list:
		if !powerup_enabled:
			return
	MusicPlayer.play_track(2)	
	

func heal(amount):
	health.heal(amount)
	
	
	
func _unhandled_input(event):
	if event.is_action_pressed("Jump"):
		charge_jump()
	elif event.is_action_released("Jump"):
		jump()
	
	if event.is_action_pressed("Rotate"):
		roll_sound.play()
		rotator.start_rotating()
	elif event.is_action_released("Rotate"):
		roll_sound.stop()
		rotator.stop_rotating()
		
	if event.is_action_pressed("Hover") and enabled_list[Global.POWERUP_INDEX.JET]:
		jet_arm.start_hover()
	elif event.is_action_released("Hover") and enabled_list[Global.POWERUP_INDEX.JET]:
		jet_arm.stop_hover()
		
	if event.is_action_pressed("Shoot") and enabled_list[Global.POWERUP_INDEX.GUN]:
		arm_joint.shoot()
		
	
# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !allowed_to_move or rotator.rotating:
		return
	horizontal = Input.get_axis("Left", "Right")
	arm_joint.rotate_towards_point(get_global_mouse_position())
	if global_position.y > death_y_zone:
		_on_health_dead()

func _physics_process(delta):
	movement.move_player(Vector2(horizontal, 0))
	handle_roll_sound()

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
	damaged_sound.play_random()
	health.damage(damage)
	
	
func _on_spring_animation_finished():
	spring_animator.visible = false


func _on_health_dead():
	dead.emit()
	death_sound.play()
	await death_sound.finished
	


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

func handle_roll_sound():
	if not roll_sound:
		return
	# A bunch of stuff to check if we should play the rolling sound and the volume
	if abs(linear_velocity.y) > 4:
		roll_sound.stop()
		return

	if not roll_sound.playing and abs(angular_velocity) > 1:
		roll_sound.play()
		roll_sound.volume_db = -25 + abs(angular_velocity)
	elif roll_sound.playing and abs(angular_velocity) < 1:
		roll_sound.stop()


func _on_grounded_checker_grounded():
	landing_sound.play()


func _on_jump_handler_jumping():
	jump_sound.play()



