class_name WalkingState

extends State

func enter() -> void:
	playback.travel("run")

func physics_state_process(delta: float) -> void:
	animation_tree.set(visuals_component.blend_pos, Vector2(entity.velocity.x, entity.velocity.z))

	if not move_component.is_moving():
		machine.change_state(Enums.CharState.IDLE)

func handle_move_dir(dir: Vector2) -> void:
	move_component.set_input_vector(dir)

func handle_move_type(event_type: Enums.MovementType) -> void:
	match event_type:
		Enums.MovementType.JUMP:
			move_component.request_jump()
		_:
			pass
