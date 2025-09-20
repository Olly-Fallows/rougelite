extends State

func enter(root: Entity, _delta: float) -> void:
	root.play("run")
	
func physics_update(root: Entity, delta: float) -> void:
	root.do_gravity(delta)
	var direction = Input.get_axis("left", "right")
	root.velocity.x = lerp(root.velocity.x, direction * root.speed, root.accel * delta)
	root.move_and_slide()
	
func graphics_update(root: Entity, _delta: float) -> void:
	if root.velocity.x > 0 : 
		root.face_right()
	elif root.velocity.x < 0 :
		root.face_left()

func check_state(root: Entity, _delta: float) -> void:
	if not root.is_on_floor():
		change_state("Fall")
		return
	if InputBuffer.check_buffer("jump"):
		change_state("Jump")
		return
	var direction = Input.get_axis("left", "right")
	if direction == 0:
		change_state("Stopping")
		return
	if InputBuffer.check_buffer("dodge"):
		change_state("Dodge")
		return
