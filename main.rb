# rubocop:disable all
require "./character.rb"
require "./brave.rb"
require "./monster.rb"
require "./games_controller.rb"

brave = Brave.new(name: "たかしお", hp: 50, offense: 15, defense: 10)
monster = Monster.new(name: "マムル", hp: 24, offense: 20, defense: 10)
games_controller = GamesController.new
games_controller.battle(brave: brave, monster: monster)

# rubocop:enable all