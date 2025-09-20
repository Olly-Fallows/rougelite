extends State

func enter(root: Entity, _delta: float) -> void:
	root.play("idle")
	root.velocity.x = 0

func physics_update(root: Entity, delta: float) -> void:
	root.do_gravity(delta)
	root.move_and_slide()

func check_state(root: Entity, _delta: float) -> void:
	if InputBuffer.check_buffer("jump"):
		change_state("Jump")
		return
	var direction = Input.get_axis("left", "right")
	if direction != 0:
		change_state("Run")
		return
	if not root.is_on_floor():
		change_state("Fall")
		return
	if InputBuffer.check_buffer("dodge"):
		change_state("Dodge")
		return
