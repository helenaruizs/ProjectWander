class_name HighlightedState

extends State

func enter() -> void:
	pass


# NOTE: Example custom override
#func handle_interaction(event_type: Enums.InteractionType) -> void:
	#match event_type:
		#Enums.InteractionType.SELECT:
			#machine.change_state(Enums.States.SELECTED)
		#Enums.InteractionType.HOVER_OUT:
			#machine.change_state(Enums.States.IDLE)
		#_:
			#pass
