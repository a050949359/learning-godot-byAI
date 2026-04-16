# Gem Runner

這是一個專門給 Godot 新手練習的超小型 2D 遊戲專案。

你可以在 30 秒內控制藍色角色移動，碰到黃色寶石就得分。這個專案刻意只用了最核心的 Godot 概念，方便你邊改邊學。

## 你會學到什麼

- 專案怎麼開啟
- 場景與節點是什麼
- GDScript 怎麼掛在節點上
- `_ready`、`_process`、`_physics_process` 的差別
- 訊號怎麼在遊戲物件互動時觸發

## 建議使用版本

使用 Godot 4.x。

## 開啟方式

1. 打開 Godot。
2. 在 Project Manager 選擇 Import。
3. 選取這個資料夾裡的 `project.godot`。
4. 匯入後按 Run Project 或 `F5`。

## 遊戲操作

- 方向鍵移動
- 也可以試試 `WASD`
- 空白鍵重新開始

## 檔案導覽

- `project.godot`: 專案設定
- `scenes/main.tscn`: 主場景，定義畫面上有哪些節點
- `scripts/main.gd`: 分數、計時、寶石重生、重新開始
- `scripts/player.gd`: 玩家移動

## 建議學習順序

1. 先看 `scenes/main.tscn`，理解節點樹。
2. 再看 `scripts/player.gd`，這是最容易懂的移動邏輯。
3. 再看 `scripts/main.gd`，理解訊號、計時器與 UI 更新。
4. 用 Godot 編輯器改數值，觀察遊戲怎麼變。

## 第一輪練習

你可以先自己試這幾件事：

1. 把 `scripts/player.gd` 裡的 `speed` 改快或改慢。
2. 把 `scripts/main.gd` 裡的 `ROUND_TIME` 改成 15 或 45。
3. 把 `scenes/main.tscn` 裡 `Background` 或 `Arena` 的顏色改掉。
4. 讓寶石一次出現兩顆，練習多物件管理。

## 下一步建議

如果你要繼續學，我建議下一個版本做這三件事：

1. 加入敵人，碰到就扣分或直接結束。
2. 加入開始畫面與結束畫面。
3. 把玩家、寶石、敵人拆成各自獨立場景。

如果你願意，我下一步可以直接帶你做其中一個版本，並且一步一步解釋每個改動的原因。