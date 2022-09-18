# rubocop:disable all
class GamesController
  EXP_CONSTANT = 2
  GOLD_CONSTANT = 3

  def battle(**params)
    build_characters(params)

    loop do
      @brave.attack(@monster)
      break if battle_end?
      @monster.attack(@brave)
      break if battle_end?
    end

    if battle_result
      result = calculate_of_exp_and_gold
      puts "#{@brave.name}はたたかいに勝った"
      puts "#{result[:exp]}の経験値と#{result[:gold]}ゴールドを獲得した"
    else
      puts "#{@brave.name}はたたかいに負けた"
      puts "目の前が真っ暗になった"
    end
  end

  private

    def build_characters(**params)
      @brave = params[:brave]
      @monster = params[:monster]
    end

    def battle_end?
      # 勇者かモンスター、どちらかのHPが0になったらバトルが終了する
      @brave.hp <= 0 || @monster.hp <= 0
    end

    def battle_result
      @brave.hp > 0
    end

    def calculate_of_exp_and_gold
      exp = (@monster.offense + @monster.defense) * EXP_CONSTANT
      gold = (@monster.offense + @monster.defense) * GOLD_CONSTANT
      result = {exp: exp, gold: gold}

      result
    end
end

# rubocop:enable all