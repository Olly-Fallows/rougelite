@icon("res://assets/development/State.png")
extends Node
class_name State

@onready
var engine: StateMachine = get_parent()

func enter(_root: Entity, _delta: float) -> void:
	pass
	
func exit(_root: Entity, _delta: float) -> void:
	pass
	
func physics_update(_root: Entity, _delta: float) -> void:
	pass
	
func graphics_update(_root: Entity, _delta: float) -> void:
	pass

func check_state(_root: Entity, _delta: float) -> void:
	pass

func change_state(state: String, delta: float = 0) -> void:
	engine.change_state(name, state, delta)
