extends Node2D

func _ready():
	$AudioStreamPlayer2D.play(true)
		

func _on_TextureButton_pressed():
	get_tree().change_scene("res://scenes/menu/conversa 1.tscn")
func _on_TextureButton3_pressed():
	get_tree().change_scene("res://scenes/menu/Ajustes.tscn")
