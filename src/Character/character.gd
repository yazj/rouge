class_name Character
extends Node2D

# the grid position of the character, after setted, turn to world position
var grid_position: Vector2i:
	set(value):
		grid_position = value
		position = Grid.grid_to_world(grid_position)
				
func _ready():
	position = Grid.world_to_grid(position)



