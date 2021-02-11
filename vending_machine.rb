class VendingMachine
  def initialize(drinks)
    # initializeメソッドで生成した@drinksには、受け取った配列の情報が代入される
    @drinks = drinks
  end

  def drinks
    @drinks
  end

  def show_drinks
    puts "いらっしゃいませ。以下の商品を販売しています"
    i = 0
    # selfは、show_drinksメソッドを適用されたインスタンス自身が、同じクラス内で定義したインスタンスメソッドdrinksを利用することを宣言している
    # selfが書かれているインスタンスメソッドを適用したインスタンス自身が代入されている変数だと考える（今回の場合、vending_machine）
    self.drinks.each do |drink|
      puts "【#{i}】#{drink.name}: #{drink.fee}円"
      i += 1
    end
  end

  def pay(user)
    puts "商品を選んでください"
    # ユーザーが選んだドリンクの番号を変数choosen_drinkに代入
    chosen_drink = user.choose_drink
    # 「ユーザーの投入金額」と「選ばれた商品の金額」の差分を計算して、その結果を変数changeに代入
    change = user.money - self.drinks[chosen_drink].fee
    if change >= 0
      puts "ご利用ありがとうございました！お釣りは#{change}円です。"
      # SlotGameクラスのインスタンスを生成しつつ、slot_gameメソッドを呼び出す
      SlotGame.new.play_slot
    else
      puts "投入金額が足りません。"
    end
  end
end