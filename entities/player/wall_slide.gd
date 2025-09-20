extends State

func enter(root: Entity, _delta: float) -> void:
	root.play("wall-slide")
	
func physics_update(root: Entity, delta: float) -> void:
	root.do_gravity(delta/2)
	var direction = Input.get_axis("left", "right")
	root.velocity.x = lerp(root.velocity.x, direction * root.speed, root.accel * delta)
	root.move_and_slide()

func graphics_update(root: Entity, _delta: float) -> void:
	if Input.is_action_pressed("right"):
		root.face_right()
	if Input.is_action_pressed("left"):
		root.face_left()

func check_state(root: Entity, _delta: float) -> void:
	if Input.is_action_pressed("right") and Input.is_action_pressed("left"):
		return
	if InputBuffer.check_buffer("jump"):
		if Input.is_action_pressed("right"):
			root.velocity.x = -root.speed*1.25
		elif Input.is_action_pressed("left"):
			root.velocity.x = root.speed*1.25
		else:
			return
		change_state("Jump")
		return
	if root.is_on_floor():
		change_state("Land")
		return
	elif not root.is_on_wall():
		change_state("Fall")
		return
