# rubocop:disable all

class Character
  attr_reader :offense, :defense
  attr_accessor :name, :hp

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end
end
class Brave < Character

  SPECIAL_ATTACK_CONSTANT = 2

  def attack(monster)
    puts "#{@name}の攻撃"

    attack_type = decision_attack_type
    damage = calculate_damage(attack_type: attack_type, target: monster)
    cause_damage(damage: damage, target: monster)

    puts "#{monster.name}の残りHPは#{monster.hp}だ"
  end

  private
  def decision_attack_type
    attack_num = rand(2)

    if attack_num == 0
      puts "必殺攻撃"
      "special_attack"
    else
      puts "通常攻撃"
      "normal_attack"
    end
  end

  def calculate_damage(**params)
    attack_type = params[:attack_type]
    target = params[:target]

      if attack_type == "special_attack"
        calculate_special_attack - target.defense
      else
        @offense - target.defense
      end
  end

  def calculate_special_attack
    @offense * SPECIAL_ATTACK_CONSTANT
  end

  def cause_damage(**params)
    damage = params[:damage]
    target = params[:target]
    puts "#{target.name}は#{damage}のダメージを受けた"
    target.hp -= damage

    target.hp = 0 if target.hp < 0

  end

end
class Monster < Character

  POWER_UP_RATE = 2
  CALC_HALF_HP = 0.5

  def initialize(**params)
    @transform_flag = false
    trigger_of_transform = params[:hp] * CALC_HALF_HP
  end

  def attack(brave) 
    if @hp <= @trigger_of_transform && @transform_flag == false
      @transform_flag == true
      transform
    end
    puts "#{@name}の攻撃"

    damage = calculate_damage(target: brave)
    cause_damage(damage: damage, target: brave)
    puts "#{brave.name}の残りHPは#{brave.hp}だ"
  end

  private
  def transform
    transform_name = "ドラゴン"
    puts <<~EOS
    #{@name}は怒っている
    #{@name}は#{transform_name}に変身した
    EOS

    @name = transform_name
    @offense *= POWER_UP_RATE
  end

  def calculate_damage(**params)
    target = params[:target]
    @offense - target.defense 
  end

  def cause_damage(**params)
    damage = params[:damage]
    target = params[:target]
    puts "#{target.name}は#{damage}のダメージを受けた"
    target.hp -= damage
    target.hp = 0 if target.hp < 0
  end
end

brave = Brave.new(name: "高塩", hp: 20, offense: 8, defense: 8)
monster = Monster.new(name: "マムル", hp: 16, offense: 12, defense: 2)

puts <<~TEXT
---勇者---
NAME   :#{brave.name}
HP     :#{brave.hp}
OFFENSE:#{brave.offense}
DEFENSE:#{brave.defense}
---モンスター---
NAME   :#{monster.name}
HP     :#{monster.hp}
OFFENSE:#{monster.offense}
DEFENSE:#{monster.defense}
----------------
TEXT

loop do
  brave.attack(monster)

  if monster.hp <= 0
    exp = (monster.offense + monster.defense) * 2
    gold = (monster.offense + monster.defense) * 3
    puts "#{brave.name}はたたかいに勝った"
    puts "#{exp}の経験値と#{gold}ゴールドを獲得した"
    break
  end

  monster.attack(brave)
  if brave.hp <= 0
    puts "#{brave.name}はたたかいに負けた"
    puts "目の前が真っ暗になった"
    break
  end
end
# rubocop:enable all