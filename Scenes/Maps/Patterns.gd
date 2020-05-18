extends Node2D

var cam
var rand = RandomNumberGenerator.new()

func create_on(x, y):
	var block = load("res://Scenes/Maps/src/crate.tscn").instance()
	get_parent().get_parent().add_child(block)
	block.position = cam + Vector2(x * 77, y * 77)

func pat21():
	create_on(7, 4)
	create_on(8, 4)
	#Pilliers
	#1
	create_on(7, 5)
	create_on(8, 5)
	create_on(7, 6)
	create_on(8, 6)
	create_on(7, 7)
	create_on(8, 7)
	create_on(7, 8)
	create_on(8, 8)
	#2
	create_on(3, 6)
	create_on(4, 6)
	create_on(3, 7)
	create_on(4, 7)
	create_on(3, 8)
	create_on(4, 8)
	#3
	create_on(11, 6)
	create_on(12, 6)
	create_on(11, 7)
	create_on(12, 7)
	create_on(11, 8)
	create_on(12, 8)
	
func pat22():
	create_on(7, 6)
	create_on(8, 6)
	#Pilliers
	#1
	create_on(7, 0)
	create_on(8, 0)
	create_on(7, 1)
	create_on(8, 1)
	create_on(7, 2)
	create_on(8, 2)
	create_on(7, 7)
	create_on(8, 7)
	create_on(7, 8)
	create_on(8, 8)
	create_on(7, 9)
	create_on(8, 9)
	#2
	create_on(3, 6)
	create_on(4, 6)
	create_on(3, 7)
	create_on(4, 7)
	create_on(3, 8)
	create_on(4, 8)
	#3
	create_on(11, 6)
	create_on(12, 6)
	create_on(11, 7)
	create_on(12, 7)
	create_on(11, 8)
	create_on(12, 8)
	
func pat23():
	create_on(5, 8)
	create_on(6, 8)
	create_on(7, 8)
	create_on(8, 8)
	create_on(9, 8)
	create_on(10, 8)
	create_on(10, 6)
	create_on(8, 4)
	create_on(9, 3)
	create_on(9, 7)
	create_on(8, 3)
	create_on(10, 7)
	#Pilliers
	#1
	create_on(7, 3)
	create_on(7, 4)
	create_on(7, 5)
	#2
	for x in range(3, 11):
		for y in range(0, 3):
			create_on(x, y)
	
	#3
	create_on(11, 6)
	create_on(12, 6)
	create_on(11, 7)
	create_on(12, 7)
	create_on(11, 8)
	create_on(12, 8)
	
func pat24():
	
	create_on(5, 4)
	create_on(6, 4)
	create_on(7, 4)
	create_on(6, 3)
	create_on(7, 3)
	create_on(7, 2)
	create_on(10, 7)
	
	create_on(9, 0)
	create_on(9, 1)
	create_on(9, 2)
	create_on(9, 3)
	create_on(9, 4)
	
	create_on(8, 8)
	create_on(9, 8)
	create_on(10, 8)
	#Pilliers
	#1
	for x in range(5, 8):
		for y in range(5, 9):
			create_on(x, y) 
		
	#3
	create_on(11, 6)
	create_on(12, 6)
	create_on(11, 7)
	create_on(12, 7)
	create_on(11, 8)
	create_on(12, 8)

func pat25():
	create_on(1, 3)
	create_on(2, 3)
	create_on(5, 2)
	create_on(6, 2)
	create_on(8, 1)
	create_on(9, 1)
	
	#Pilliers
	#1
	for x in range(5, 7):
		for y in range(3, 9):
			create_on(x, y)
	for x in range(8, 10):
		for y in range(2, 9):
			create_on(x, y)
	#3
	create_on(11, 6)
	create_on(12, 6)
	create_on(11, 7)
	create_on(12, 7)
	create_on(11, 8)
	create_on(12, 8)

func find_path(i):
#	i = 5
	if i == 1: pat21()
	if i == 2: pat22()
	if i == 3: pat23()
	if i == 4: pat24()
	if i == 5: pat25()
	print("Pattern number ", i)

func pattern_gestion(cam_pos):
	cam = cam_pos
	rand.randomize()
	find_path(rand.randi_range(1, 5))
