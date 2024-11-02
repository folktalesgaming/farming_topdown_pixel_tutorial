extends NodeState

@export var player: Player
@export var player_animated_sprite_2d: AnimatedSprite2D

func _on_process(_delta : float) -> void:
	pass

func _on_physics_process(_delta : float) -> void:
	if player.player_direction == Vector2.UP:
		player_animated_sprite_2d.play("idle_back")
	elif player.player_direction == Vector2.RIGHT:
		player_animated_sprite_2d.play("idle_right")
	elif player.player_direction == Vector2.LEFT:
		player_animated_sprite_2d.play("idle_left")
	elif player.player_direction == Vector2.DOWN:
		player_animated_sprite_2d.play("idle_front")
	else:
		player_animated_sprite_2d.play("idle_front")
	

func _on_next_transitions() -> void:
	GameInputEvents.movement_input()
	
	if GameInputEvents.is_movement_input():
		transition.emit("Walk")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	player_animated_sprite_2d.stop()
