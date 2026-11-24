extends CharacterBody2D

const SPEED = 60
var GRAVITY = 5
var direction = 1

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft


func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
	elif ray_cast_left.is_colliding():
		direction = 1
	position.x += direction * SPEED * delta
	move_and_slide()

func _physics_process(_delta: float) -> void:
	# this is a built in function to tell whether they are on floor or not. if not on floor, 
	# it adds gravity. this is for jumping but can be changed to x for speed or smt
	if not is_on_floor():
		velocity.y += GRAVITY
		
