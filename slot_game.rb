# 以下のスロットゲームのような、目に見えない機能や振る舞いも、役割が異なれば別クラスに分ける必要がある
class SlotGame
  def play_slot
    result = []
    3.times do
      # randメソッドは、擬似乱数を生成する事が出来る
      result << rand(0..9)
    end
    # joinメソッドは、「配列.join」で配列の中の要素を文字列にしてそのまま連結させる
    puts "スロットゲームの結果は#{result.join}です！"
    if result[0] == result[1] && result[0] == result[2]
      puts "おめでとうございます！"
    else
      puts "残念でした〜"
    end
  end
end