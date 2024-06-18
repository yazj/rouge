class_name Player
extends Character

@onready var input_handler: InputHandler = $InputHandler

# 
var _can_move: bool = true

func _ready():
	super._ready()

func _physics_process(delta):
	var action: Action = await input_handler.get_action(self)
	
	if action is MoveAction and _can_move:
		_can_move = false
		var player_grid_pos = Grid.world_to_grid(position)
		player_grid_pos += action.offset
		var dest = Vector2(Grid.grid_to_world(player_grid_pos))
		var tween = create_tween()
		tween.tween_property(self, "position", dest, 0.4)
		await tween.finished
		_can_move = true
