extends Node

var events: Dictionary = {
	"jump": false,
	"dodge": false
}

func _input(event: InputEvent) -> void:
	for key in events.keys():
		print(key)
		if Input.is_action_just_pressed(key):
			events[key] = true
		elif Input.is_action_just_released(key):
			events[key] = false

func check_buffer(event: String):
	if events[event]:
		events[event] = false
		return true
	return false
