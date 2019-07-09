class Oystercard

MAXIMUM_BALANCE = 90
FARE = 3

attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(money)
    raise "Maximum balance is #{MAXIMUM_BALANCE} pounds!" if allowed?(money)
    @balance += money
    return money
  end

  def deduct
    @balance -= FARE
    return FARE
  end

private

  def allowed?(money)
    new_balance = @balance += money
    new_balance > MAXIMUM_BALANCE
  end
end
