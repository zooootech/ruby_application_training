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