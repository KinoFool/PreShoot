extends Area2D

export(NodePath) var player_node
export(NodePath) var checkpoint_node
onready var player_func = get_parent().get_parent().get_node("Dog")
var player
var checkpoint

func _ready():
	player = get_node(player_node)
	checkpoint = get_node(checkpoint_node)
	connect("body_entered", self, "maybe_player_entered")

func maybe_player_entered(maybe_player):
	var new = load("res://Scenes/Maps/CP Block.tscn")
	if maybe_player == player:
		var instance = new.instance()
		checkpoint.global_position = global_position
		player_func.motion.x = 0
		player_func.motion.y = 0
		player_func.checkpoint_past()
		$".".queue_free()
		instance.set_name("CP")
		get_parent().add_child(instance)
		get_parent().get_node("CP").position = Vector2(100, 50)
