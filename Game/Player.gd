extends Node2D

export (NodePath) var world_node_path
export (NodePath) var camera_path
export (int) var speed
onready var greenLaser = preload("res://Game/laser_green.tscn")
export (int) var scrollSpeed

func _ready():
	pass
	
func _get_player_input(delta):
	var velocity = Vector2()
	if(Input.is_action_pressed("left")):
		velocity.x -= 1
	if(Input.is_action_pressed("right")):
		velocity.x += 1
	if(Input.is_action_pressed("down")):
		velocity.y += 1
	if(Input.is_action_pressed("up")):
		velocity.y -= 1
	var motion = Vector2()
	motion.y -= scrollSpeed
	motion += velocity * speed
	position += motion * delta
	if(Input.is_action_just_pressed("fire")):
		_fire()

func _clamp():
	var cam_width = get_node(camera_path).get_viewport().size.x
	var cam_x = get_node(camera_path).position.x
	position.x = clamp(position.x,cam_x - (cam_width / 2), cam_width)
	var cam_height = get_node(camera_path).get_viewport().size.y
	var cam_y = get_node(camera_path).position.y
	var player_height = get_node("Sprite").texture.get_height()
	position.y = clamp(position.y, (cam_y + player_height) - (cam_height / 2), 
		(cam_y - (cam_height / 2) + cam_height + player_height))

func _fire():
	var sprite_height = get_node("Sprite").texture.get_height()
	var world =  get_node(world_node_path)
	
	var l = greenLaser.instance()
	l.position.y = position.y - (sprite_height / 2)
	l.position.x = position.x - 8
	world.add_child(l)
	
	var l2 = greenLaser.instance()
	l2.position.y = position.y - (sprite_height / 2)
	l2.position.x = position.x + 8
	world.add_child(l2)

func _process(delta):
	_get_player_input(delta)
	_clamp()
	