extends Node2D

const bg = preload("res://background.tscn")

signal ded
signal done

signal jump
signal key

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.connect('ded',self,"_on_Player_ded")
	$Player.connect("done",self,'_on_Player_done')
	$Player.connect('jump',self,"_on_Player_jump")
	$Player.connect('key',self,"_on_Player_key")
	
	var bi = bg.instance()
	add_child(bi)
	

func _on_Player_ded():
	emit_signal("ded")


func _on_Player_done():
	emit_signal("done")

func _on_Player_jump():
	emit_signal("jump")

func _on_Player_key():
	emit_signal("key")
