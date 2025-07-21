class_name VisualsComponent

extends Node3D

const blend_pos : String = "parameters/run/blend_position"

@export_category("Visuals Setup")
@export var sprite : Sprite3D
@export var animation_tree : AnimationTree
@onready var playback: AnimationNodeStateMachinePlayback = animation_tree["parameters/playback"]


#############
### API #####
#############

func flip_sprite(answer: bool) -> void:
	sprite.flip_h = answer
