@icon("res://assets/development/Hitbox.png")
extends Area2D
class_name Hitbox

signal hit(hurtbox: Hurtbox)

@export
var damage: float = 1

func _ready() -> void:
	area_entered.connect(func(area):
		if area is Hurtbox:
			hit.emit(area))
