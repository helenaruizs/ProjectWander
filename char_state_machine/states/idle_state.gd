class_name IdleState

extends State

func enter() -> void:
	playback.travel("idle")

func physics_state_process(delta: float) -> void:
	if move_component.is_moving():
		machine.change_state(Enums.CharState.WALKING)

func handle_move_dir(dir: Vector2) -> void:
	move_component.set_input_vector(dir)

func handle_move_type(event_type: Enums.MovementType) -> void:
	match event_type:
		Enums.MovementType.JUMP:
			move_component.request_jump()
		_:
			pass
#func handle_interaction(event_type: Enums.InteractionType) -> void:
	#match event_type:
		#Enums.InteractionType.SELECT:
			#machine.change_state(Enums.States.SELECTED)
		#Enums.InteractionType.HOVER_IN:
			#machine.change_state(Enums.States.HIGHLIGHTED)
		#Enums.InteractionType.HOVER_OUT:
			#pass
		#_:
			#pass
