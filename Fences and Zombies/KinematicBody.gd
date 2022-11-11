extends KinematicBody


# How fast the player moves in meters per second.
export var speed = 14
# The downward acceleration when in the air, in meters per second squared.
export var fall_acceleration = 75

var velocity = Vector3.ZERO


func _physics_process(delta):
	# We create a local variable to store the input direction.
	var direction = Vector3.ZERO

	# We check for each move input and update the direction accordingly.
	if Input.is_key_pressed(KEY_D):
		direction.x += 1
	if Input.is_key_pressed(KEY_A):
		direction.x -= 1
	if Input.is_key_pressed(KEY_S):
		# Notice how we are working with the vector's x and z axes.
		# In 3D, the XZ plane is the ground plane.
		direction.z += 1
	if Input.is_key_pressed(KEY_W):
		direction.z -= 1
	if direction != Vector3.ZERO:
		direction = direction.normalized()
			# Ground velocity
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		#Vertical velocity
		velocity.y -= fall_acceleration * delta
	# Moving the character
		velocity = move_and_slide(velocity, Vector3.UP)
