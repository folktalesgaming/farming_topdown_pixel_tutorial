class_name CollectableComponet
extends Area2D

@export var collectable_name: String

func _on_body_entered(body):
	if body is Player:
		get_parent().queue_free()
