extends Node2D

@onready var player = preload("res://src/Character/character.tscn")

@onready var characters = $Characters
@onready var move_action: MoveAction
@onready var input_handler: InputHandler = $InputHandler
@onready var camera: Camera2D = $Camera2D

var player_pos: Vector2i

# Called when the node enters the scene tree for the first time.
func _ready():
	player = Character.new()
	
	remove_child(camera)
	player.add_child(camera)
	
	characters.add_child(player)
	player_pos = player.grid_position 
	
#func _input(event):
	#
	#if Input.is_action_just_pressed("ui_up"):
		#move_action = MoveAction.new(player, 0, -1)
		#player_pos += move_action.offset
		#player.position = Grid.grid_to_world(player_pos)
	#elif Input.is_action_just_pressed("ui_down"):
		#move_action = MoveAction.new(player, 0, 1)
		#player_pos += move_action.offset
		#player.position = Grid.grid_to_world(player_pos)
	#elif Input.is_action_just_pressed("ui_left"):
		#move_action = MoveAction.new(player, -1, 0)
		#player_pos += move_action.offset
		#player.position = Grid.grid_to_world(player_pos)
	#elif Input.is_action_just_pressed("ui_right"):
		#move_action = MoveAction.new(player, 1, 0)
		#player_pos += move_action.offset
		#player.position = Grid.grid_to_world(player_pos)
	#else:
		#return
	#
	
var i: float = 0;
var speed: float = 0.7;

func _physics_process(delta) -> void:
	
	i += speed;
	if i >= 10:
		if Input.is_action_pressed("ui_up"):
			move_action = MoveAction.new(player, 0, -1)
			player_pos += move_action.offset
			player.position = Grid.grid_to_world(player_pos)
		elif Input.is_action_pressed("ui_down"):
			move_action = MoveAction.new(player, 0, 1)
			player_pos += move_action.offset
			player.position = Grid.grid_to_world(player_pos)
		elif Input.is_action_pressed("ui_left"):
			move_action = MoveAction.new(player, -1, 0)
			player_pos += move_action.offset
			player.position = Grid.grid_to_world(player_pos)
		elif Input.is_action_pressed("ui_right"):
			move_action = MoveAction.new(player, 1, 0)
			player_pos += move_action.offset
			player.position = Grid.grid_to_world(player_pos)
		else:
	
			return
		i = 0
	
	

