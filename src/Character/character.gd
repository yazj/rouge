class_name Character
extends Area2D

# visuals
@onready var animated_sprite2d := AnimatedSprite2D.new()
@onready var sprite_frame = preload("res://assets/sprite_frames/character_sprite_frames.tres")

# gameplay
var is_at_battle: bool = false

var grid_position: Vector2i:
	set(value):
		grid_position = value
		position = Grid.grid_to_world(grid_position)
		
func _process(_delta):
	animated_sprite2d.play("idle_front")
		
func _ready():

	position = Grid.world_to_grid(position)
	
	self.add_child(animated_sprite2d)
	
	animated_sprite2d.position = Vector2i.ZERO
	
	animated_sprite2d.scale = Vector2i(Global.sprite_scale, Global.sprite_scale)
	animated_sprite2d.centered = false
	animated_sprite2d.position += Vector2(-128, -128)
	animated_sprite2d.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	animated_sprite2d.sprite_frames = sprite_frame
	
func move(move_offset: Vector2i):
	grid_position += move_offset
	
