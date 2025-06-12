extends Node2D

var enemy_scene = preload("res://entities/enemies/enemy.tscn")

func _ready() -> void:
	get_parent().get_node("Boundary").connect("area_entered", Callable(self, "the_end"))
	var timer = Timer.new()
	timer.wait_time = 1.5
	timer.autostart = true
	timer.one_shot = false
	timer.timeout.connect(spawn_enemy)
	add_child(timer)

func the_end(body:Node2D):
	if body is Enemy:
		get_tree().change_scene_to_file("res://Scenes/GameOverScene/game_over.tscn")

func spawn_enemy() -> void:
	var enemy = enemy_scene.instantiate()
	get_parent().get_node("Enemies").add_child(enemy)  # Adjust path if needed
#
#extends Node2D
#
#var enemy_scene = preload("res://entities/enemies/enemy.tscn")
#
#func _ready() -> void:
	## Create and configure the timer
	#var timer = Timer.new()
	#timer.wait_time = 1.5
	#timer.one_shot = false
	#timer.autostart = true
	#timer.timeout.connect(spawn_enemy)
	#add_child(timer)
#
#func spawn_enemy() -> void:
	#var enemy = enemy_scene.instantiate()
#
	## Optional: Set random X and fixed Y=0 here instead of in the enemy itself
	#var screen_width = get_viewport().get_visible_rect().size.x
	#enemy.position = Vector2(randi() % int(screen_width), 0)
#
	## Add to Enemies node (adjust path if needed)
	#get_parent().get_node("Enemies").add_child(enemy)

#extends Node2D
#
#var enemy_scene = preload("res://entities/enemies/enemy.tscn")
#
#func _ready() -> void:
	#randomize()
#
	#var timer = Timer.new()
	#timer.wait_time = 1.5
	#timer.one_shot = false
	#timer.autostart = true
	#timer.timeout.connect(spawn_enemy)
	#add_child(timer)
#
#func spawn_enemy() -> void:
	#var enemy = enemy_scene.instantiate()
#
	## Get screen width to randomize X
	#var screen_width = get_viewport().get_visible_rect().size.x
	#var x_pos = randf_range(0, screen_width)
#
	## Position the enemy at (x, 0)
	#enemy.position = Vector2(x_pos, 0)
#
	## Add to "Enemies" node (adjust path if needed)
	#get_parent().get_node("Enemies").add_child(enemy)
	##print("Spawned at: ", enemy.position)
	#print("Canvas Size: ", get_viewport().get_visible_rect().size)
