class Drink
  # initializeメソッドは、インスタンスが生成された瞬間に、生成されたそのインスタンスが実行する処理を定義するインスタンスメソッド
  def initialize(name, fee)
    @name = name
    @fee = fee
  end

  # 「インスタンス.name」という記述によって、設定したインスタンス変数の値が得られるようになる
  def name
    @name
  end

  # 「インスタンス.fee」という記述によって、設定したインスタンス変数の値が得られるようになる
  def fee
    @fee
  end
end

class VendingMachine
end

class User
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

puts drinks