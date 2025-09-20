extends State

@export
var dodge_time: int = 100
@export
var dodge_cooldown: int = 400
var last_dodge: int = Time.get_ticks_msec()

var can_dodge: bool = false

func enter(root: Entity, _delta: float) -> void:
	if can_dodge:
		if Time.get_ticks_msec() - last_dodge > dodge_cooldown:
			var direction = Input.get_axis("left", "right")
			root.velocity.x = direction * root.speed*3
			root.velocity.y = 0
			last_dodge = Time.get_ticks_msec()
			root.play("dodge")
			can_dodge = false
			return
	change_state("Run")

func exit(root: Entity, _delta: float) -> void:
	root.velocity *= Vector2(0.5, 0.5)

func check_state(_root: Entity, _delta: float) -> void:
	if Time.get_ticks_msec() - last_dodge > dodge_time:
		change_state("Run")
		
func physics_update(root: Entity, _delta: float) -> void:
	root.move_and_slide()
