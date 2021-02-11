# requireはRubyファイルやライブラリ（ライブラリもあくまでRubyのファイルの集合体）を読み込むためのメソッドで、Rubyファイルを読み込むには、ディレクトリを明示して記述する必要がある
require "./drink"
require "./vending_machine"
require "./user"
require "./slot_game"

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