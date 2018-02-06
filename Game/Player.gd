extends Node2D

export (NodePath) var world_node_path
export (int) var speed
onready var greenLaser = preload("res://Game/laser_green.tscn")

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
	var motion = (velocity * speed) * delta
	position += motion
	if(Input.is_action_just_pressed("fire")):
		_fire()

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
	