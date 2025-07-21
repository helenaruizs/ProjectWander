class_name ConditionResource

extends Resource

# NOTE: This is something called bit flags, and it's kinda like a bar code situation, it makes it so each entry is an on/off switch
enum Conditions {
	NONE = 0,           # 0000
	TARGET = 1 << 0,  # 0001 = 1
	ACTIVE = 1 << 1,    # 0010 = 2
	HAS_ITEM = 1 << 2,    # 0100 = 4
	HAS_OBJECTIVE = 1 << 3,      # 1000 = 8 (...)
	
	LOCKED = 1 << 4,
	BROKEN = 1 << 5,
	HAZARD = 1 << 6,
	# TODO: Add conditions here
}
@export_category("Conditions")
@export_flags(
	# None -> It equals 0, so needs to be ommitted
	"Target",
	"Active",
	"Has Item",
	"Has Objective",
	
	"Locked",
	"Broken",
	"Hazard",)
	
var conditions_mask : int = Conditions.NONE # Variable name of the "box" for the flags above ^

# Maps a conditions‐mask → a tile‐state
# Each rule can be either an exact match or a “contains these bits” match.
@export var condition_ruleset: Array[Dictionary] = [
# Example rule
	{
		"mask": Conditions.NONE,
		"match_exact": true,
		"state": Enums.UIStates.NORMAL,
	},

	# TODO: add more specific rules for resource file in the editor
]
