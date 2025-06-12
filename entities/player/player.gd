extends Node2D

var bullet_scene = preload("res://entities/bullet/bullet.tscn")
var enemy_scene = preload("res://entities/enemies/enemy.tscn")

var direction:int = 0
var speed:int = 100
var spaceShip_size:int = 32
var canvas_size:int = 400
var shoot_time:float= 1.0
var shoot_counter:float=0
var drag_offset_x: float = 0
var dragging: bool = false

func _process(delta: float) -> void:
	shoot_counter+=delta
	
	if shoot_counter>=shoot_time: #and Input.is_action_pressed("Shoot"):
		shoot_counter=0
		shoot()
		
	if Input.is_action_pressed("Move_Left"):
		direction-=1
	elif Input.is_action_pressed("Move_Right"):
		direction+=1
	else:
		direction=0
		
	position.x = clamp(position.x+direction*speed*delta, spaceShip_size/2, canvas_size-spaceShip_size/2)

func _unhandled_input(event):
	# Touch input (drag)
	if event is InputEventScreenTouch:
		if event.pressed:
			dragging = true
			drag_offset_x = event.position.x - position.x
		else:
			dragging = false
	elif event is InputEventScreenDrag and dragging:
		var new_x = event.position.x - drag_offset_x
		position.x = clamp(new_x, 32, 400 - 32)

func shoot():
	var bullet_instance=bullet_scene.instantiate()
	#bullet_instance.position.x=position.x
	#bullet_instance.position.y=position.y-20
	bullet_instance.position = position - Vector2(0, 20)
	get_parent().get_node("Bullets").add_child(bullet_instance)
