extends Control

var bodyColour : int
var accessoryColour : int
var accessoryType : int
var hairType : int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bodyColour = 0
	accessoryColour = 0
	accessoryType = 0
	hairType = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_left_pressed() -> void:
	if bodyColour <= 0:
		bodyColour = CharacterManager.colours.size()-1
	else:
		bodyColour -= 1
	_modify_character(false, false, false, true)


func _on_button_right_pressed() -> void:
	if bodyColour >= CharacterManager.colours.size()-1:
		bodyColour = 0
	else:
		bodyColour += 1
	_modify_character(false, false, false, true)




func _on_acessory_button_left_pressed() -> void:
	if accessoryType >= CharacterManager.accessories.size()-1:
		accessoryType = 0
	else:
		accessoryType += 1
	_modify_character(false, true, false, false)
	pass


func _on_accessory_button_right_pressed() -> void:
	if accessoryType <= 0:
		accessoryType = CharacterManager.accessories.size()-1
	else:
		accessoryType -= 1
	_modify_character(false, true, false, false)
	pass # Replace with function body.

func _modify_character(hair:bool, acc:bool, accColour: bool, bodColour: bool):
	if (hair):
		pass
	elif (acc):
		$ChrAccessory.texture = load(CharacterManager.accessories[accessoryType])
		print($ChrAccessory.texture)
	elif (accColour):
		pass
	elif (bodColour):
		var charBodyColour = CharacterManager.colours[bodyColour]
		$ChrBody.material.set("shader_parameter/my_colour", Vector4(charBodyColour.r, charBodyColour.g, charBodyColour.b, 1.0))
		print(CharacterManager.colours[bodyColour])
	
