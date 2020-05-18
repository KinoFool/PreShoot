extends Area2D

export(NodePath) var player_node
export(NodePath) var checkpoint_node
onready var player_func = get_parent().get_parent().get_node("Dog")
onready var camera = get_parent().get_parent().get_node("Camera2D")
onready var pattern = get_node("Patterns")
var rand = RandomNumberGenerator.new()
var current = 2
var player
var checkpoint
var checkpoint_margin = Vector2(616, 0)
var player_position

func _ready():
	player = get_node(player_node)
	checkpoint = get_node(checkpoint_node)
	connect("body_entered", self, "maybe_player_entered")
	
func random_direction():
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
	checkpoint_margin = camera.trans_way(way)
	
func end_blocks(way):
	var new = load("res://Scenes/Maps/src/crate.tscn")
	var block1 = new.instance()
	var block2 = new.instance()
	var pos1 = Vector2()
	var pos2 = Vector2()
	get_parent().add_child(block1)
	get_parent().add_child(block2)
	if way == 0 or way == 4:
		pos1.x = 7 * 77
		pos2.x = 8 * 77
	if way == 1 or way == 2 or way == 3:
		pos1.x = 11 * 77
		pos2.x = 12 * 77
	if way == 5 or way == 6 or way == 7:
		pos1.x = 3 * 77
		pos2.x = 4 * 77
	if way == 2 or way == 6:
		pos1.y = 5 * 77
	if way == 0 or way == 1 or way == 7:
		pos1.y = 2 * 77
	if way == 3 or way == 4 or way == 5:
		pos1.y = 8 * 77
	pos2.y = pos1.y
	block1.position = camera.position + pos1
	block2.position = camera.position + pos2

func generate_newblocks(way):
	pattern.pattern_gestion(camera.position)
	end_blocks(way)

func next_step():
	var way = random_direction()
	way = 2
	print("Way = ", way)
	camera.change_camera(way)
	tp_checkpoint(way)
	generate_newblocks(way)
	

func maybe_player_entered(item):
	if item == player:
		next_step()
		player_func.motion.x = 0
		player_func.motion.y = 0
		player_func.checkpoint_past()
		player_position = player.position
