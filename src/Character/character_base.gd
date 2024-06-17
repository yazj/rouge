# the base class of character
# just define the base properties of the character
# The properties that change as the game progresses, 
# such as animations and equipment, will be defined in character_definition
class_name CharacterBase
extends  AnimatedSprite2D

var grid_position: Vector2i:
	set(value):
		grid_position = value
		position = Grid.grid_to_world(grid_position)

func _init() -> void:
	self.scale = Vector2i(Global.sprite_scale, Global.sprite_scale)
