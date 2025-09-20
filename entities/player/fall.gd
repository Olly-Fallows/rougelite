extends State

func enter(root: Entity, _delta: float) -> void:
	root.play("fall")
	
func physics_update(root: Entity, delta: float) -> void:
	root.do_gravity(delta)
	var direction = Input.get_axis("left", "right")
	if abs(root.velocity.x) < root.speed or sign(root.velocity.x) != sign(direction) or abs(root.velocity.x) > root.speed*2:
		root.velocity.x = lerp(root.velocity.x, root.speed * direction, root.accel * delta * 0.5)
	root.move_and_slide()
	
func graphics_update(root: Entity, _delta: float) -> void:
	if root.velocity.x > 0 : 
		root.face_right()
	elif root.velocity.x < 0 :
		root.face_left()
		
func check_state(root: Entity, _delta: float) -> void:
	if root.is_on_floor():
		change_state("Land")
		return
	if root.is_on_wall():
		change_state("WallSlide")
		return
	if Input.is_action_just_pressed("dodge"):
		change_state("Dodge")
		return
