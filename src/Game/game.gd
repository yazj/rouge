extends Node2D

@onready var player = preload("res://src/Character/character.tscn")

@onready var characters = $Characters
@onready var move_action: MoveAction
@onready var input_handler: InputHandler = $InputHandler
@onready var camera: Camera2D = $Camera2D

var player_grid_pos: Vector2i

# Called when the node enters the scene tree for the first time.
func _ready():
	player = Character.new()
	
	remove_child(camera)
	player.add_child(camera)
	
	characters.add_child(player)
	
	player_grid_pos = Grid.world_to_grid(player.position)

var can_move: bool = true
func _physics_process(delta) -> void:
	var action: Action = await input_handler.get_action(player)
	
	if action is MoveAction and can_move:
		can_move = false
		player_grid_pos += action.offset
		var dest = Vector2(Grid.grid_to_world(player_grid_pos))
		var tween = create_tween()
		tween.tween_property(player, "position", dest, 0.2)
		await tween.finished
		can_move = true


