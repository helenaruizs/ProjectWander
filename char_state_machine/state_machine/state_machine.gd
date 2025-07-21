class_name StateMachine

extends Node

@export var state_scripts: Dictionary[Enums.CharState, GDScript] = {}
@export var is_player_controlled: bool = false
var starting_state: State = null
# The code bellow is something called an “immediately‐invoked function expression”
#(IIFE) in GDScript: you define a tiny anonymous function right where you need it,
#then immediately call it to compute your default value
# NOTE: Immediate style of function calling, useful
var current_state: State = null

var state_nodes: Dictionary[Enums.CharState, NodePath] = {}
var animation_tree : AnimationTree = null # TODO: Animation tree for the entity


func _ready() -> void:
	await owner.ready
	instantiate_states()
	current_state = get_initial_state()
	current_state.enter()
	

func instantiate_states() -> void:
	for state: Enums.CharState in state_scripts.keys():
		var script: Script = state_scripts.get(state, null)
		var state_instance := State.new()
		state_instance.set_script(script)
		
		# (Optional) give it a consistent name (enum name or script class)
		state_instance.name = Enums.CharState.keys()[state]  # or script.resource_path.get_file().get_basename()
		
		add_child(state_instance)
		
		# Perform your original per-state initialization
		state_instance.init_setup(self, get_parent(), state)
		var state_path : NodePath = get_path_to(state_instance)
		state_nodes[state] = state_path

func get_initial_state() -> State:
	return starting_state if starting_state != null else get_child(0)

func change_state(new_state: Enums.CharState) -> void:
	var previous_state := current_state
	var next_state := state_nodes[new_state]
	var entity := get_parent() as Node
	current_state = get_node(next_state)
	previous_state.exit()
	current_state.enter()
	# TEST: Printing marker info for debug
	SignalBus.emit_signal("state_changed", entity, new_state)

func is_current_state(state_enum: Enums.CharState) -> bool:
	# get the StateNode for this enum (or null if it doesn't exist)
	var node_for_enum : NodePath = state_nodes.get(state_enum, null)
	# compare to the machine's current_state
	return get_node(node_for_enum) == current_state
	
func _process(delta: float) -> void:
	if current_state != null:
		current_state.state_process(delta)

func _physics_process(delta: float) -> void:
	if current_state != null:
		current_state.physics_state_process(delta)

func _input(event: InputEvent) -> void:
	if current_state != null:
		current_state.handle_input(event)

###############################
#### INPUT SIGNAL HANDLING ####
##############################

func state_handle_move_dir(dir: Vector2) -> void:
	# give your current state a chance to handle it
	current_state.handle_move_dir(dir)

func state_handle_move_type(event_type: Enums.MovementType) -> void:
	# give your current state a chance to handle it
	current_state.handle_move_type(event_type)
