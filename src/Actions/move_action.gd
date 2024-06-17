class_name MoveAction
extends ActionWithDirection

func perform() -> bool:
	var destination: Vector2i = get_destination()
	character.move(destination)
	return true
