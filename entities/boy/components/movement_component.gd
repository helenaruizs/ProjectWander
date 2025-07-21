class_name MovementComponent

extends Node

@export_category("Movement Parameters")
@export_range(0.0, 30.0) var max_speed: float = 5.0
@export_range(0.0, 50.0) var acceleration: float = 20.0
@export_range(0.0, 50.0) var deceleration: float = 25.0
@export_range(0.0, 30.0) var jump_impulse: float = 6.0
@export var allow_air_control: bool = true

@export_category("Gravity")
@export var use_custom_gravity: bool = false
@export_range(0.0, 30.0) var custom_gravity: float = 0.0
@export_range(0.0, 30.0) var fall_multiplier: float = 1.4  # Makes falling a bit faster
@export_range(0.0, 30.0) var low_jump_multiplier: float = 2.0 # Tap jump -> shorter jump

# Internal
var entity: Player
var gravity: float
var _input_dir: Vector2 = Vector2.ZERO
var _jump_requested: bool = false


#####################
### FUNCTIONALITY ###
#####################

func _ready() -> void:
	gravity = get_gravity()

func _physics_process(delta: float) -> void:
	if entity == null:
		push_error("Player was not found")
		return

	var _velocity: Vector3 = entity.velocity
	if not entity.is_on_floor():
		_velocity.y += gravity * delta
	else:
		if _velocity.y < 0.0:
			_velocity.y = 0.0
	
	if _jump_requested and entity.is_on_floor():
			_velocity.y = jump_impulse
			
	_jump_requested = false
	
	var desired_movement := Vector3(_input_dir.x, 0, _input_dir.y).normalized() * max_speed
	var horizontal_movement := Vector3(_velocity.x, 0, _velocity.z)
	if desired_movement != Vector3.ZERO:
		horizontal_movement = horizontal_movement.move_toward(desired_movement, acceleration * delta)
	else:
		horizontal_movement = horizontal_movement.move_toward(Vector3.ZERO, deceleration * delta)
	_velocity.x = horizontal_movement.x; _velocity.z = horizontal_movement.z
	
	print(_input_dir)
	
	entity.velocity = _velocity
	entity.move_and_slide()
	

####################
##### INTERNAL #####
####################

func init_setup(_entity: Player) -> void:
	entity = _entity


#################
#### HELPERS ####
#################

func get_gravity() -> float:
	return custom_gravity if use_custom_gravity else Const.GRAVITY

########################
##### PUBLIC API #######
########################

func set_input_vector(dir: Vector2) -> void:
	_input_dir = dir

func request_jump() -> void:
	_jump_requested = true

func is_moving() -> bool:
	if _input_dir == Vector2.ZERO:
		return false
	else:
		return true 
