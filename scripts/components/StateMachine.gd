@icon("res://assets/development/StateMachine.png")
extends Node
class_name StateMachine

@export
var root: Entity

@export
var default_state: State
@onready
var current_state: State = default_state

func change_state(current: String, next: String, delta: float) -> void:
	if current != current_state.name:
		return
	force_state(next, delta)

func force_state(next: String, delta: float) -> void:
	var new_state = get_node(next)
	if new_state == null or new_state is not State:
		return
	current_state.exit(root, delta)
	new_state.enter(root, delta)
	current_state = new_state
	
func _physics_process(delta: float) -> void:
	current_state.check_state(root, delta)
	current_state.physics_update(root, delta)

func _process(delta: float) -> void:
	current_state.graphics_update(root, delta)
