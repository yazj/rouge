class_name ActionWithDirection
extends Action

var offset: Vector2i

func _init(character: Character, dx: int, dy: int) -> void:
	super._init(character)
	offset = Vector2i(dx, dy)

func get_destination() -> Vector2i:
	return character.grid_position + offset
