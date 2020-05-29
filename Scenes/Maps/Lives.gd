extends Node2D

onready var player = get_parent().get_parent().get_node("Dog")
onready var camera =  get_parent().get_parent().get_node("Camera2D")
onready var hud = get_parent().get_node("Lives")
onready var sfx = get_parent().get_parent().get_node("Camera2D/New_score")

onready var live = 3

func _ready():
	live = 3

func _physics_process(delta):
	if camera.zone[0] > 1 and live > 0:
		player.fall = do_player_failed()
	if camera.zone[0] == 1:
		player.can_reload = false
	else:
		player.can_reload = true

func do_player_failed():
	if player.position.x > camera.position.x and player.position.x < camera.position.x + 1024:
		if player.position.y > camera.position.y - 100 and player.position.y < camera.position.y + 600:
			return false
	print("False !!! ", player.position, camera.position)
	return true

func game_over():
	sfx.high_score_reached()
	camera.smoothing_enabled = true
	camera.smoothing_speed = 2
	camera.zoom.x = camera.zone[0]
	camera.zoom.y = camera.zone[0]
	camera.position = camera.position
	camera.position = Vector2(77 - 300, -300  + (1 / ((camera.zone[0] - 1) * (camera.zone[0] - 1))) * 10 )
	print(camera.zoom)

func death():
	var p_check = get_parent().get_parent().get_node("Generation/CP").player_position
	player.position = p_check
	live -= 1
	if live == 0:
		game_over()
		return
	player.motion = Vector2(0, 0)
	player.stock_moves[0].clear()
	player.stock_moves[1].clear()
	player.x_time = 0
	player.status = "recording"
	print(live)
