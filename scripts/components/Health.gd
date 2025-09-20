@icon("res://assets/development/Health.png")
extends Node
class_name Health

signal hurt(damage, hitbox)
signal heal(health, hitbox)
signal dead

@export
var max_health: float = 1
@onready
var health: float = max_health

func _ready() -> void:
	for child in get_children():
		if child is Hurtbox:
			child.hurt.connect(take_damage)
			
func take_damage(hitbox: Hitbox):
	var damage = hitbox.damage
	if damage > 0:
		hurt.emit(damage, hitbox)
	elif damage < 0:
		heal.emit(-damage, hitbox)
	else:
		return
	health -= damage
	if health <= 0:
		dead.emit()
