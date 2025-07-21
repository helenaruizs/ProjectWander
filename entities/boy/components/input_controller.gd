class_name InputController

extends Node

signal move_dir(dir: Vector2)
signal movement_action(action: Enums.MovementType)

var _last_dir := Vector2.ZERO

func _process(_delta: float) -> void:
	var dir := Vector2(
		int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left")),
		int(Input.is_action_pressed("move_back"))  - int(Input.is_action_pressed("move_forward"))
	).normalized()

	if dir != _last_dir:
		_last_dir = dir
		emit_signal("move_dir", dir)

	# jump
	if Input.is_action_just_pressed("jump"):
		emit_signal("movement_action", Enums.MovementType.JUMP)


func init_setup(state_machine: StateMachine) -> void:
	move_dir.connect(state_machine.state_handle_move_dir)
	movement_action.connect(state_machine.state_handle_move_type)
