class_name GameInputEvents

static var direction: Vector2;

static func movement_input() -> Vector2:
	if Input.is_action_pressed("move_left"):
		direction = Vector2.LEFT
	elif Input.is_action_pressed("move_down"):
		direction = Vector2.DOWN
	elif Input.is_action_pressed("move_up"):
		direction = Vector2.UP
	elif Input.is_action_pressed("move_right"):
		direction = Vector2.RIGHT
	else:
		direction = Vector2.ZERO
	
	return direction

static func is_movement_input() -> bool:
	if direction == Vector2.ZERO:
		return false;
	return true;
	
static func use_tool() -> bool:
	var using_tool: bool = Input.is_action_pressed("hit")
	
	return using_tool;
