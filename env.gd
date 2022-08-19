extends Node

var PlayerScore = 0
var OppScore = 0

func _on_Left_body_entered(body):
	OppScore += 1
	score_achieved()

func _on_Right_body_entered(body):
	PlayerScore += 1
	score_achieved()

func _process(delta):
	$PlayerScore.text = str(PlayerScore)
	$OppScore.text = str(OppScore)
	$CountdownLabel.text = str(int($Countdown.time_left))

func _on_Countdown_timeout():
	get_tree().call_group('ballGroup', 'restart_ball')
	$CountdownLabel.visible = false

func score_achieved():
	$ball.position = Vector2(518, 300)
	get_tree().call_group('ballGroup', 'stop_ball')
	$Countdown.start()
	$CountdownLabel.visible = true
	$ScoreSound.play()
