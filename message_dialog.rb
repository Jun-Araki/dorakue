module MessageDialog
  def attack_message(**params)
    attack_type = params[:attack_type]

    puts "#{@name}の攻撃"
    puts "必殺攻撃" if attack_type == "special_attack"
  end

  def damage_message(**params)
    target = params[:target]
    damage = params[:damage]

    puts "#{target.name}は#{damage}のダメージを受けた"
    puts "#{target.name}の残りHPは#{target.hp}だ"
  end

  def end_message(result)
    if result[:brave_win_flag]
      puts "#{@brave.name}はたたかいに勝った"
      puts "#{result[:exp]}の経験値と#{result[:gold]}ゴールドを獲得した"
    else
      puts "#{@brave.name}はたたかいに負けた"
      puts "目の前が真っ暗になった"
    end
  end

  def transform_message(**params)
    origin_name = params[:origin_name]
    transform_name = params[:transform_name]

    puts "#{origin_name}は怒っている"
    puts "#{origin_name}は#{transform_name}に変身した"
  end
end
