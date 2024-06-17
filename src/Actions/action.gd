class_name Action
extends RefCounted

var character: Character

func _init(character: Character) -> void:
	self.character = character
	
func perform() -> bool:
	return false
