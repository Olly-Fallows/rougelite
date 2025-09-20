@icon("res://assets/development/Hurtbox.png")
extends Area2D
class_name Hurtbox

signal hurt(hitbox: Hitbox)

func _ready() -> void:
	area_entered.connect(func(area):
		if area is Hitbox:
			hurt.emit(area))
