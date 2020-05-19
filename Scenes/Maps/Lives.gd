extends Node2D

onready var player = get_parent().get_parent().get_node("Dog")
onready var camera =  get_parent().get_parent().get_node("Camera2D")
onready var hud = get_parent().get_node("Lives")

onready var live = 3

func _ready():
	live = 3
	
func game_over():
	camera.smoothing_enabled = true
	camera.smoothing_speed = 2
	camera.zoom.x = camera.zone[0]
	camera.zoom.y = camera.zone[0]
	camera.position = camera.position
	camera.position = Vector2(77 - 300, -300  + (camera.zone[0] - 1) * 50)
	print(camera.zoom)

func death():
	var p_check = get_parent().get_parent().get_node("Generation/CP").player_position
	live -= 1
	if live == 0:
		game_over()
		return
	player.position = p_check
	player.status = "recording"
	player.stock_moves[0].clear()
	player.stock_moves[1].clear()
	player.x_time = 0
	print(live)
