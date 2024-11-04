extends NodeState

@export var player: Player
@export var player_animated_sprite_2d: AnimatedSprite2D
@export var hit_component_collision_shape: CollisionShape2D

func _ready():
	hit_component_collision_shape.disabled = true
	hit_component_collision_shape.position = Vector2(0, 0)

func _on_process(_delta : float) -> void:
	pass

func _on_physics_process(_delta : float) -> void:
	pass

func _on_next_transitions() -> void:
	if !player_animated_sprite_2d.is_playing():
		transition.emit("Idle")

func _on_enter() -> void:
	if player.player_direction == Vector2.UP:
		hit_component_collision_shape.position = Vector2(0, -18)
		player_animated_sprite_2d.play("chopping_back")
	elif player.player_direction == Vector2.RIGHT:
		hit_component_collision_shape.position = Vector2(9, 0)
		player_animated_sprite_2d.play("chopping_right")
	elif player.player_direction == Vector2.LEFT:
		player_animated_sprite_2d.play("chopping_left")
		hit_component_collision_shape.position = Vector2(-9, 0)
	elif player.player_direction == Vector2.DOWN:
		hit_component_collision_shape.position = Vector2(0, 3)
		player_animated_sprite_2d.play("chopping_front")
	else:
		player_animated_sprite_2d.play("chopping_front")
		hit_component_collision_shape.position = Vector2(0, 3)
		
	hit_component_collision_shape.disabled = false

func _on_exit() -> void:
	player_animated_sprite_2d.stop()
	hit_component_collision_shape.disabled = true
	hit_component_collision_shape.position = Vector2(0, 0)
