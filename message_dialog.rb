module MessageDialog
  def attack_message(**params)# rubocop:disable all
    attack_type = params[:attack_type]

    puts "#{@name}の攻撃"
    puts "必殺攻撃" if attack_type == "special_attack"
  end

  def damage_message(**params)# rubocop:disable all
    target = params[:target]
    damage = params[:damage]

    puts <<~EOS
      #{target.name}は#{damage}のダメージを受けた
      #{target.name}の残りHPは#{target.hp}だ
    EOS
  end

  def end_message(result)# rubocop:disable all
    if result[:brave_win_flag]
      puts "#{@brave.name}はたたかいに勝った"
      puts "#{result[:exp]}の経験値と#{result[:gold]}ゴールドを獲得した"
    else
      puts "#{@brave.name}はたたかいに負けた"
      puts "目の前が真っ暗になった"
    end
  end

  def transform_message
    #     #{@name}は怒っている
    #     #{@name}は#{transform_name}に変身した
  end
end
