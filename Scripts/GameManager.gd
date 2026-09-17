extends Node


@onready var playerPiece: PlayerPiece = $"../PlayerPiece"
var spaceMarkers : Array[Marker3D]
@export var spaceNode :Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	for child in spaceNode.get_children():
		spaceMarkers.append(child)
	playerPiece.global_position = spaceMarkers[0].global_position
	
	
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	pass


func _input(event):
	if event.is_action_pressed("forward"):
		move_forward()
	if event.is_action_pressed("backward"):
		move_backward()

func move_forward():
	if playerPiece.board_position < spaceMarkers.size()-1 and playerPiece.moveSprite == false:
		playerPiece.board_position = playerPiece.board_position + 1
		playerPiece.move_on_board(spaceMarkers[playerPiece.board_position].global_position)
	pass
	
func move_backward():
	if playerPiece.board_position >0 and playerPiece.moveSprite == false:
		playerPiece.board_position = playerPiece.board_position - 1
		playerPiece.move_on_board(spaceMarkers[playerPiece.board_position].global_position)
	pass
