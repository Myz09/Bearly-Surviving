extends RigidBody3D
var velocity = Vector3(0,0,0)
#var position = Vector3(0,4,0)
var gravity = 70
#var jump_strength = 25
#var velocity = Vector3(0,0,0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(position)
	var input = Vector3.ZERO
	#input.x = Input.get_axis("move_left", "move_right")
	#input.z = Input.get_axis("move_forward", "move_back")
	if Input.is_action_pressed("move_left"):
		velocity.x -=.0002
	if Input.is_action_pressed("move_right"):
		velocity.x+=.0002
	if Input.is_action_pressed("move_forward"):
		velocity.z+=.0002
	if Input.is_action_pressed("move_back"):
		velocity.z-=.0002
	#if Input.is_action_just_pressed("jump"):
		#velocity.y +=1
	#if velocity.y>0 || position.y >2.6:
		#velocity.y-=.02
	
	move()
	
	
	apply_central_force(input * 1000.0 * delta)
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if position.y < 0:
		respawn()
#func jump():
	#if Input.is_action_pressed("jump"):
func respawn():
	position.y = 4
	position.x = 0
	position.z = 0
	velocity.x = 0
	#velocity.y = 0
	velocity.z = 0
	
func move():
	position.x+=velocity.x
	#position.y+=velocity.y
	position.z +=velocity.z
