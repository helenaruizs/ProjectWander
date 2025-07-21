class_name State
# Base class for all piece states using the “direct push” API.
# States call `machine.change_state(...)` to move to the next state.

extends Node

# NOTE: To call the next state, use machine.change_state(next_state : Enum.States)

# State's name for quicker referencing
@export var state_id : Enums.CharState

# Reference to the parent StateMachine
var machine: StateMachine
# Reference to the parent entity
var entity : Node
var move_component: MovementComponent
var visuals_component: VisualsComponent
var animation_tree: AnimationTree
var playback: AnimationNodeStateMachinePlayback

func init_setup(_state_machine: StateMachine, _entity: Node, _state_id: Enums.CharState) -> void:
	machine = _state_machine
	entity = _entity
	state_id = _state_id
	move_component = entity.get_move_component()
	visuals_component = entity.get_visuals_component()
	animation_tree = visuals_component.animation_tree
	playback = animation_tree["parameters/playback"]

# Called once, immediately after this state node has been added as a child of the StateMachine.
func enter() -> void:
	# TEST: Print State name
	# Print this state’s class_name to the console
	#var name_to_print : String = Enums.enum_to_string(Enums.States, state_id)
	#print("Entering state:", name_to_print)
	pass
	
# Called just before this state is removed. Override to clean up.
func exit() -> void:
	pass

# Called from StateMachine._input() only on the active state.
# Override to react to InputEvents.
func handle_input(event: InputEvent) -> void:
	pass

# Called from StateMachine._physics_process() only on the active state.
# Override for per-frame physics logic.
func physics_state_process(delta: float) -> void:
	pass

# Called from StateMachine._process() only on the active state.
# Override for non-physics per-frame logic.
func state_process(delta: float) -> void:
	pass

# Condition handler, signal based
func handle_conditions(cond: ConditionResource) -> void:
	pass


func handle_move_dir(dir: Vector2) -> void:
	pass


func handle_move_type(event_type: Enums.MovementType) -> void:
	pass


func handle_action(event_type: Enums.ActionType) -> void:
	pass
