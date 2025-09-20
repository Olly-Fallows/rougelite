extends State

var direction: float = -1
@export
var slime: PackedScene = preload("res://effects/slime trail.tscn")
var can_spawn: bool = true

func _ready() -> void:
	$Timer.timeout.connect(func():
		can_spawn = true)

func enter(_root: Entity, _delta: float) -> void:
	pass
	
func exit(_root: Entity, _delta: float) -> void:
	pass
	
func physics_update(root: Entity, delta: float) -> void:
	root.do_gravity(delta)
	if root.get_node("LeftWalk").is_colliding():
		direction = 1
	if root.get_node("RightWalk").is_colliding():
		direction = -1
	root.velocity.x = root.speed * direction
	root.move_and_slide()
	if can_spawn:
		if root.is_on_floor():
			if direction == 1:
				if root.get_node("Left").is_colliding():
					var s = slime.instantiate()
					get_tree().current_scene.add_child(s)
					s.global_position = (root.global_position + Vector2(-7+randf()*4, 8))
					can_spawn = false
			if direction == -1:
				if root.get_node("Right").is_colliding():
					var s = slime.instantiate()
					get_tree().current_scene.add_child(s)
					s.global_position = (root.global_position + Vector2(7-randf()*4, 8))
					can_spawn = false
	
func graphics_update(_root: Entity, _delta: float) -> void:
	pass

func check_state(_root: Entity, _delta: float) -> void:
	pass
