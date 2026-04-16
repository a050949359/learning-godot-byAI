extends Node2D

const PLAY_AREA := Rect2(Vector2(40.0, 80.0), Vector2(880.0, 420.0))
const ROUND_TIME := 30.0

@onready var player: CharacterBody2D = $Player
@onready var coin: Area2D = $Coin
@onready var score_label: Label = $CanvasLayer/ScoreLabel
@onready var time_label: Label = $CanvasLayer/TimeLabel
@onready var message_label: Label = $CanvasLayer/MessageLabel
@onready var game_timer: Timer = $GameTimer

var rng := RandomNumberGenerator.new()
var score := 0


func _ready() -> void:
	rng.randomize()
	player.play_area = PLAY_AREA
	start_game()


func _process(_delta: float) -> void:
	if game_timer.is_stopped():
		return

	time_label.text = "剩餘時間：%.1f" % game_timer.time_left


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept") and game_timer.is_stopped():
		start_game()


func start_game() -> void:
	score = 0
	player.global_position = PLAY_AREA.get_center()
	player.can_move = true
	message_label.text = "收集黃色寶石\n方向鍵或 WASD 移動"
	coin.show()
	coin.monitoring = true
	game_timer.start(ROUND_TIME)
	place_coin()
	update_hud()


func place_coin() -> void:
	coin.global_position = Vector2(
		rng.randf_range(PLAY_AREA.position.x + 24.0, PLAY_AREA.end.x - 24.0),
		rng.randf_range(PLAY_AREA.position.y + 24.0, PLAY_AREA.end.y - 24.0)
	)


func update_hud() -> void:
	score_label.text = "分數：%d" % score

	if game_timer.is_stopped():
		time_label.text = "剩餘時間：0.0"
	else:
		time_label.text = "剩餘時間：%.1f" % game_timer.time_left


func _on_coin_body_entered(body: Node) -> void:
	if body != player or game_timer.is_stopped():
		return

	score += 1
	update_hud()
	place_coin()


func _on_game_timer_timeout() -> void:
	player.can_move = false
	coin.hide()
	coin.monitoring = false
	update_hud()
	message_label.text = "時間到，得分：%d\n按空白鍵重新開始" % score
