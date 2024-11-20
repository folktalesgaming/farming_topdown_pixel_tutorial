extends Node2D

@onready var interactable_component = $InteractableComponent
@onready var interactable_label_component = $InteractableLabelComponent

func _ready() -> void:
	interactable_label_component.hide()
	interactable_component.interactable_activated.connect(on_interactable_activated)
	interactable_component.interactable_deactivated.connect(on_interactable_deactivated)
	
func on_interactable_activated() -> void:
	interactable_label_component.show()

func on_interactable_deactivated() -> void:
	interactable_label_component.hide()
