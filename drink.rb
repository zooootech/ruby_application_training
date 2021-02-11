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