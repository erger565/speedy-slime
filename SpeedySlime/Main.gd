extends Control



func _ready():
	if MusicMuted.muted == false:
		$AudioStreamPlayer.play(0)


func _on_Exit_pressed():
	get_tree().quit()


func _on_Play_pressed():
	get_tree().change_scene("res://Game.tscn")


func _on_Music_pressed():
	if MusicMuted.muted == false:
		MusicMuted.muted = true
		$AudioStreamPlayer.stop()
	else:
		MusicMuted.muted = false
		$AudioStreamPlayer.play(0)

func _physics_process(delta):
	if Input.is_key_pressed(KEY_SPACE):
		get_tree().change_scene("res://Game.tscn")



func _on_SFX_pressed():
	if MusicMuted.sfx == false:
		MusicMuted.sfx = true
	else:
		MusicMuted.sfx = false
