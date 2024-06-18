class_name InputHandler
extends Node

const directions = {
	"move_up": Vector2i.UP,
	"move_down": Vector2i.DOWN,
	"move_left": Vector2i.LEFT,
	"move_right": Vector2i.RIGHT,
}

func get_action(character: Character) -> Action:
	var action: Action = null
	# movement action
	for direction in directions:
		if Input.is_action_pressed(direction):
			var offset: Vector2i = directions[direction]
			action = MoveAction.new(character, offset.x, offset.y)
	return action
