extends KinematicBody2D

export (int) var speed = 300
export (int) var jump_speed = -700
export (int) var gravity = 1200

var velocity = Vector2.ZERO
var jumping = false;

onready var screen_size = get_viewport_rect().size

func get_input():
	velocity.x = 0
	if Input.is_action_pressed("walk_right"):
		velocity.x += speed
	if Input.is_action_pressed("walk_left"):
		velocity.x -= speed
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	screenWrap()

func _physics_process(delta):
	get_input()
	if Input.is_action_just_pressed('jump') and is_on_floor():
		jumping = true
		velocity.y = jump_speed

	if jumping and Input.is_action_just_released("jump"):
		if velocity.y < -50:
			velocity.y = -50

	velocity.y += gravity * delta

	velocity = move_and_slide(velocity, Vector2.UP)

	if jumping and is_on_floor():
		jumping = false


func screenWrap():
	position.x = wrapf(position.x, 0, screen_size.x)
	position.y = wrapf(position.y, 0, screen_size.y)
