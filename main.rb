# rubocop:disable all
class Brave

  attr_accessor :hp
  attr_reader :name, :offense, :defense

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

end

brave = Brave.new(name: "高塩", hp: 20, offense: 10, defense: 8)
brave2 = Brave.new(name: "大地", hp: 10, offense: 15, defense: 5)
brave3 = Brave.new(name: "勝見", hp: 14, offense: 4, defense: 3)

puts <<~TEXT
NAME   :#{brave.name}
HP     :#{brave.hp}
OFFENSE:#{brave.offense}
DEFENSE:#{brave.defense}
TEXT

brave.hp -= 10
puts "#{brave.name}は#{brave.hp}のダメージを受けた"
自分で考えてみよう明日明日どうすれば良いかああっしたtどうすああっしたtどうす
実際の現場では、自分で考えてコードを書けるようにすることが何よりも重要になります。
# rubocop:enable all