class Player
  def hand
    # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
    puts "いずれかの数字を入力してください"
    puts "#{0}：グー"
    puts "#{1}：チョキ"
    puts "#{2}：パー"
    err = 1
    until err == 0
      rsp = gets.chomp.to_i
      if rsp < 0 || 2 < rsp
        puts "0、1、2　のいずれかを入力してください"
        err = 1
      else
        err = 0
      end
    end
    return rsp
  end
end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
    rsp = rand(3)
    return rsp
  end
end

class Janken
  def pon(player_hand, enemy_hand,rsplist)
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する

    puts "プレイヤー【#{player_hand}：#{rsplist[player_hand]}】 VS enemy【#{enemy_hand}：#{rsplist[enemy_hand]}】"
    case ((player_hand - enemy_hand + 3 ) % 3)
    when 2
      puts "プレイヤーの勝ちです"
      return 0
    when 1
      puts "エネミーの勝ちです"
      return 0
    when 0
      puts "あいこです"
      return 1
    end
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new
rsplist = ["グー","チョキ","パー"]
draw = 1
# 下記の記述で、ジャンケンメソッドが起動される
while draw == 1
  draw = janken.pon(player.hand, enemy.hand,rsplist)
end

# ここに書かれているRubyの記述はあくまでヒントとして用意された雛形なので、書かれている記述に従わずに実装したいという場合は、自分の好きに実装して構わない。課題要件を満たし、コードの品質が一定の水準にあると判定されればどのような実装でも合格になる。
