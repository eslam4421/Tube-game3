extends Area2D

# مجموعة اللاعب
const PLAYER_GROUP = "player"

# مسار الـ Spawn
@export var spawn_path: NodePath

@onready var spawn_node: Node2D = (
	get_node(spawn_path) if spawn_path != NodePath("") else null
)

func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body: Node) -> void:
	if body.is_in_group(PLAYER_GROUP):
		if spawn_node:
			body.global_position = spawn_node.global_position
		else:
			print("Spawn node not assigned!")
		queue_free()
