extends Node

enum CharState {
	NONE,
	IDLE,
	WALKING,
	JUMPING,
	# TODO: Add states here
}

enum UIState {
	NONE,
	IDLE,
	HIGHLIGHTED,
	SELECTED,
	# TODO: Add states here
}

enum InteractionType {
	NONE,
	SELECT,
	DESELECT,
	HOVER_IN,
	HOVER_OUT,
	GRAB,
	DRAG,
	RELEASE,
	SECONDARY_ACTION, # right-click for example
}

enum MovementType {
	NONE,
	MOVE,
	JUMP,
	FALL,
	RUN,
	WALK,
	# TODO: Add more actions here
}

enum CombatType {
	NONE,
	ATTACK,
	DEFEND,
	# TODO: Add more actions here
}

enum ActionType {
	NONE,
	OPEN,
	LOOK,
	USE,
	# TODO: Add more actions here
}
