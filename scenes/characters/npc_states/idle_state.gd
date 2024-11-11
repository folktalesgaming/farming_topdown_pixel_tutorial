extends NodeState

@export var character: CharacterBody2D
@export var animated_sprite_2d: AnimatedSprite2D
@export var idle_state_time: float = 5.0

@onready var idle_state_timer: Timer = Timer.new()

var idle_state_timeout: bool = false

func _ready():
	idle_state_timer.wait_time = idle_state_time
	idle_state_timer.timeout.connect(_on_idle_state_timer_timeout)
	add_child(idle_state_timer)
	pass

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	if idle_state_timeout:
		transition.emit("walk")


func _on_enter() -> void:
	animated_sprite_2d.play("idle")
	
	idle_state_timeout = false
	idle_state_timer.start()


func _on_exit() -> void:
	animated_sprite_2d.stop()
	idle_state_timer.stop()

func _on_idle_state_timer_timeout() -> void:
	idle_state_timeout = true