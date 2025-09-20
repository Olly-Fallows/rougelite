extends CharacterBody2D
class_name Entity

var sprites: Array[AnimatedSprite2D]

@export
var speed: float = 200
@export
var accel: float = 10
@export
var jump_vel: float = 350

func _ready() -> void:
	for child in get_children():
		if child is AnimatedSprite2D:
			sprites.append(child)

func play(animation: String) -> void:
	for s in sprites:
		s.play(animation)

func face_right() -> void:
	for s in sprites:
		s.flip_h = false
	
func face_left() -> void:
	for s in sprites:
		s.flip_h = true

func do_gravity(delta: float) -> void:
	velocity.y += World.gravity*delta
