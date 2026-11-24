extends CharacterBody2D

# this is a varibale to change the speed now and then

var SPEED = 100.0
var JUMP_VELOCITY = -200
var GRAVITY = 5

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
# Don't use raw values, using variables is usually better, hardcoding

# This is a built in _physics_process which checks gravity 60 times a second
# delta is the amount of time since not is on floor last ran
func _physics_process(_delta: float) -> void:
	# this is a built in function to tell whether they are on floor or not. if not on floor, 
	# it adds gravity. this is for jumping but can be changed to x for speed or smt
	if not is_on_floor():
		velocity.y += GRAVITY
		#  this tells to use gravity when not on floor

	# Handle jump.
	if Input.is_action_just_pressed("Up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	
	# Flips the sprite
	
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Play animation
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("Idle")
		else:
			animated_sprite.play("Run")
	else:
		animated_sprite.play("Jump")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
