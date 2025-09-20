extends State

func enter(root: Entity, _delta: float) -> void:
	root.play("stopping")
	
func exit(root: Entity, _delta: float) -> void:
	root.velocity.x = 0
	
func physics_update(root: Entity, delta: float) -> void:
	root.do_gravity(delta)
	root.velocity.x = lerp(root.velocity.x, 0.0, root.accel * delta * 4)
	root.move_and_slide()
	
func check_state(root: Entity, _delta: float) -> void:
	if is_zero_approx(root.velocity.x):
		change_state("Idle")
