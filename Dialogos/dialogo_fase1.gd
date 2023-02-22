extends ColorRect

#	Exportar o arquivo json
export var dialogPath = ""
export(float) var textSpeed = 0.05

var dialog

var phraseNum = 0 
var finished = false
var botao = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = textSpeed
	dialog = getDialog()
	assert(dialog, "Dialog not found")
	nextPhrase()
	
	$Button.visible = false


func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if finished:
			nextPhrase()
		else:
			$Text.visible_characters = len($Text.text)
	
	if botao == true:
		$Button.visible = true
	

func getDialog() -> Array:
	# Check if the file of the dialogue exist
	var f = File.new()
	# se a condição for falso retorna essa mensagem
	assert(f.file_exists(dialogPath), "File path does not exist")
	
	# Abre o arquivo
	f.open(dialogPath, File.READ)
	# Transforma o conteúdo dentro do arquivo em um formato texto
	var json = f.get_as_text()
	
	# Transformar o texto em uma variável usavel
	var output = parse_json(json)
	
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return []

func nextPhrase() -> void:
	# Checar se existe mais dialogo que precisa ser mostrado
	if phraseNum >= len(dialog):
	#	queue_free() # libera a memoria excluindo o tudo que está detro do colorect incluindo o botão
		botao = true
		return
	
	# Mostra se o dialogo acabou
	finished = false
	
	# Determinar o nome e texto em si do dialogo
	$Name.bbcode_text = dialog[phraseNum]["Name"]
	$Text.bbcode_text = dialog[phraseNum]["Text"]
	
	$Text.visible_characters = 0
	
	if $Name.bbcode_text == "Alex":
		$PersonagemVtal.visible = 0
		$balaodefalaVtal.visible = 0
		
		$Alex.visible = 1
		$balaodefalaAlex.visible = 1
	elif $Name.bbcode_text == "Trutinha da Vtal":
		$Alex.visible = 0
		$balaodefalaAlex.visible = 0
		
		$PersonagemVtal.visible = 1
		$balaodefalaVtal.visible = 1
	
	while $Text.visible_characters < len($Text.text):
		$Text.visible_characters += 1
		
		$Timer.start()
		yield($Timer, "timeout")
	
	finished = true
	phraseNum += 1
	return

func _on_Button_pressed():
	get_tree().change_scene("res://scenes/fase 2/crossingroad.tscn")
