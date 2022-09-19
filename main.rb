require "./character"
require "./brave"
require "./monster"
require "./games_controller"

brave = Brave.new(name: "高塩", hp: 50, offense: 15, defense: 10)
monster = Monster.new(name: "マムル", hp: 24, offense: 20, defense: 10)

games_controller = GamesController.new

games_controller.battle(brave:, monster:)
