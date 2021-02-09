class Drink
  # initializeメソッドは、インスタンスが生成された瞬間に、生成されたそのインスタンスが実行する処理を定義するインスタンスメソッド
  def initialize(name, fee)
    @name = name
    @fee = fee
  end

  # 「インスタンス.name」という記述によって、設定したインスタンス変数の値が得られるようになる
  # このような、インスタンス変数の値のみを戻り値としたメソッドのことをゲッターと呼ぶ
  def name
    @name
  end

  # 「インスタンス.fee」という記述によって、設定したインスタンス変数の値が得られるようになる
  def fee
    @fee
  end
end

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
    choosen_drink = user.choose_drink
    # 「ユーザーの投入金額」と「選ばれた商品の金額」の差分を計算して、その結果を変数changeに代入
    change = user.money - self.drinks[choosen_drink].fee
    if change >= 0
      puts "ご利用ありがとうございました！お釣りは#{change}円です。"
    else
      puts "投入金額が足りません。"
    end
  end
end

class User
  def initialize(money)
    @money = money
  end

  def money
    @money
  end

  def choose_drink
    gets.to_i
  end
end

puts "商品を用意してください。"
drinks = []
3.times do |i|
  puts "商品名を入力してください。"
  drink_name = gets.chomp
  puts "金額を入力してください。"
  drink_fee = gets.to_i
  # Drinkクラスのインスタンスを生成し、配列に追加
  drinks << Drink.new(drink_name, drink_fee)
end

# VendingMachineクラスのインスタンス生成の際、事前に登録した3つの商品情報を含む配列drinksを、実引数として渡している
vending_machine = VendingMachine.new(drinks)
vending_machine.show_drinks

puts "あなたはお客さんです。投入金額を決めてください。"
money = gets.to_i
user = User.new(money)

vending_machine.pay(user)