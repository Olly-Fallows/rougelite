extends Entity

func _physics_process(_delta: float) -> void:
	if is_on_floor() or is_on_wall():
		$StateMachine/Dodge.can_dodge = true
