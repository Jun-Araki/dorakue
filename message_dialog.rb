module MessageDialog
  def attack_message(**params)# rubocop:disable all
    attack_type = params[:attack_type]

    puts "#{@name}の攻撃"
    puts "必殺攻撃" if attack_type == "special_attack"

    # puts "#{monster.name}の残りHPは#{monster.hp}だ"
  end

  # def damage_message
  #   puts "#{target.name}は#{damage}のダメージを受けた"

  #   puts <<~EOS
  #     #{@name}は怒っている
  #     #{@name}は#{transform_name}に変身した
  #   EOS
  # end

  # def end_message
  #   if battle_win?
  #     puts "#{@brave.name}はたたかいに勝った"
  #     puts "#{result[:exp]}の経験値と#{result[:gold]}ゴールドを獲得した"
  #   else
  #     puts "#{@brave.name}はたたかいに負けた"
  #     puts "目の前が真っ暗になった"
  #   end
  # end
end
