class Oystercard

MAXIMUM_BALANCE = 90
FARE = 3

attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(money)
    new_balance = @balance += money
    if new_balance > MAXIMUM_BALANCE
      raise "Maximum balance is #{MAXIMUM_BALANCE} pounds!"
    else
      @balance += money
      return money
    end
  end

  def deduct
    @balance -= FARE
    return FARE
  end
end
