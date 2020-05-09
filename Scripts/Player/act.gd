extends KinematicBody2D

var motion = Vector2()
var status = "recording"
var stock_moves = [[], []]
var Timer = 0
var x_time = 0

export var gravity = 20

const UP = Vector2(0, -1)
export var puissance_saut = -600
export var vitesse = 200


func move_in_x(current_key):
	if current_key == "right":
		return (vitesse)
	elif current_key == "left":
		return (-vitesse)
	else:
		return (0)

func move_in_y(current_key):
	print(is_on_floor())
	if current_key == "up" and is_on_floor() == true:
		motion.y = puissance_saut

func do_jump():
	pass
#	if motion.y < 2:
#		$Sprite.play("jump")
#	if motion.y > -2:
#		$Sprite.play("fall")

func jump_gestion():
	if is_on_wall() == true:
		motion.x = 0
	if is_on_floor() == false:
		do_jump()
		return true
	return false

func run_gestion():
	pass
#	if motion.x > 0:
#		$Sprite.flip_h = false
#		$Sprite.play("run")
#	elif motion.x < 0:
#		$Sprite.flip_h = true
#		$Sprite.play("run")
#	elif status == "end" and motion.x == 0:
#		$Sprite.play("dead")

func reload_scene(fall):
	if Input.is_action_just_pressed("ui_reload") or fall > 2000:
		get_tree().reload_current_scene()

func _physics_process(delta):
	check_sequence(status, delta)
	animation()
	gravity()
	if motion.y == -600:
		print("Saut")
	move_and_slide(motion, UP)
	reload_scene(motion.y)

func a_move():
	if Input.is_action_just_pressed("ui_right"):
		return "right"
	if Input.is_action_just_pressed("ui_left"):
		return "left"
	if Input.is_action_just_pressed("ui_up"):
		return "up"
	return "none"

func record_moves():
#	$Sprite.play("stopped")
	var key = a_move()
	if key != "none":
		stock_moves[0].append(round(Timer * 1000) / 1000)
		stock_moves[1].append(key)

func play_moves():
	if x_time == len(stock_moves[0]) or len(stock_moves[0]) == 0:
		print("FIN!!")
		status = "end"
		return
	print(x_time)
	if round(Timer * 1000) / 1000 >= stock_moves[0][x_time]:
		printt(stock_moves[0][x_time], stock_moves[1][x_time])
		motion.x += move_in_x(stock_moves[1][x_time])
		move_in_y(stock_moves[1][x_time])
		x_time += 1

func gravity():
	if is_on_floor() == false:
		motion.y += gravity
	elif motion.y > 20:
		motion.y = 20


func check_status():
	if Input.is_action_just_pressed("ui_accept"):
		Timer = stock_moves[0][0]
		print ("Play mode activé !")
		print (stock_moves)
		status = "play"

func check_sequence(status, delta):
	if status == "recording":
#		$Sprite.play("stopped")
		recording_time(delta)
		check_status()
	elif status == "play":
		status = play_moves()
		Timer += 1 * delta


func recording_time(delta):
	record_moves()
	Timer += 1 * delta


func animation():
	if jump_gestion() == true:
		return
	run_gestion()
