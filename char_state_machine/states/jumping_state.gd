class_name JumpingState

extends State

func enter() -> void:
	pass

#
#func handle_interaction(event_type: Enums.InteractionType) -> void:
	#match event_type:
		#Enums.InteractionType.SELECT:
			#machine.change_state(Enums.States.HIGHLIGHTED)
		#Enums.InteractionType.HOVER_IN:
			#pass
		#Enums.InteractionType.HOVER_OUT:
			#pass
		#Enums.InteractionType.DESELECT:
			#machine.change_state(Enums.States.IDLE)
		#_:
			#pass
