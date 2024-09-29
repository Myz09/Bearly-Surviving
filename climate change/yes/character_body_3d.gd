extends CharacterBody3D


const SPEED = 7.5
const JUMP_VELOCITY = 7
var list = ["res://facts_1.tscn","res://facts_2.tscn", "res://facts_3.tscn", "res://facts_4.tscn", "res://facts_5.tscn"]
var i =0;
var rng = RandomNumberGenerator.new()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	if(position.y <=0):
		respawn()
	if position.x >=90:
		get_tree().change_scene_to_file("res://ends.tscn")
	i+=1
func respawn():
	
	position.y = 3
	position.x = 0
	position.z = -.075
	velocity.y = 0
	velocity.x =0
	velocity.z = 0

	get_tree().change_scene_to_file(list[i%5])
