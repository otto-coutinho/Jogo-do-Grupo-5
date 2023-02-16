extends Node2D

# Começa a música do jogo
func _ready():
	$AudioStreamPlayer2D.play(true)

# Botão de start para começar o jogo
func _on_TextureButton_pressed():
	get_tree().change_scene("res://scenes/menu/conversa 1.tscn")

# Botão de ajustes
func _on_TextureButton3_pressed():
	get_tree().change_scene("res://scenes/menu/Ajustes.tscn")
