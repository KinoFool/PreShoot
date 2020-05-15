extends Area2D

export(NodePath) var player_node
export(NodePath) var checkpoint_node
onready var player_func = get_parent().get_parent().get_node("Dog")
onready var camera = get_parent().get_parent().get_node("Camera2D")
var rand = RandomNumberGenerator.new()
var current = 2
var player
var checkpoint
var checkpoint_margin = Vector2(600, 0)

func _ready():
	player = get_node(player_node)
	checkpoint = get_node(checkpoint_node)
	connect("body_entered", self, "maybe_player_entered")
	
func random_position():
	rand.randomize()
	var nb = rand.randi_range(0, 7)
	while nb < current - 1 or nb > current + 1:
		nb = current
		nb += rand.randi_range(-1, 1)
	current = nb
	return nb
	
func tp_checkpoint(way):
	checkpoint.position -= checkpoint_margin
	checkpoint.position += camera.trans_way(way) * 2
	checkpoint_margin = camera.trans_way(way) * 1
	
func generate_newblocks(way):
	var new = load("res://Scenes/Maps/src/crate.tscn")
	var block
#	var places = []
	rand.randomize()
	for i in range(0, 9):
		block = new.instance()
		get_parent().add_child(block)
		block.position = checkpoint_margin + Vector2(rand.randi_range(1, 9) * 77, rand.randi_range(1, 5) * 77)
		

func next_step():
	var way = random_position()
	camera.change_camera(way)
	tp_checkpoint(way)
	generate_newblocks(way)
#	get_parent().add_child(block)
#	print(block.global_position)
#	block.global_position = Vector2(100, 100)
	

func maybe_player_entered(item):
	if item == player:
		next_step()
		player_func.motion.x = 0
		player_func.motion.y = 0
		player_func.checkpoint_past()
