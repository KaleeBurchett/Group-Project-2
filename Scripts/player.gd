extends CharacterBody2D

class_name Player

@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export var speed = 200.0
@export var jump_velocity = -550.0
@export var gravity = 800.0

func _ready() -> void:
	animation_player.play("idle")

func _physics_process(delta):

	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed
		animation_player.play("run")
		$Sprite2D.flip_h = (direction > 0)
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		if is_on_floor():
			animation_player.play("idle")
	
	if not is_on_floor():
		velocity.y += gravity * delta
		animation_player.play("jump")

	if Input.is_action_just_pressed("jump") and is_on_floor():
		animation_player.play("jump")
		velocity.y = jump_velocity

	move_and_slide()
