class Oystercard

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1
MINIMUM_FARE = 3

attr_reader :balance, :entry_station

  def initialize
    @balance = 0
    @entry_station
  end

  def top_up(money)
    raise "Maximum balance is £#{MAXIMUM_BALANCE}!" if allowed?(money)
    @balance += money
    return money
  end

  def touch_in(station)
    raise "Minimum balance is £#{MINIMUM_BALANCE}!" if minimum_balance?
    @entry_station = station
    in_journey?
  end

  def touch_out
    deduct
    @entry_station = nil
    in_journey?
  end

private

  def deduct
    @balance -= MINIMUM_FARE
    return MINIMUM_FARE
  end

  def allowed?(money)
    new_balance = @balance += money
    new_balance > MAXIMUM_BALANCE
  end

  def in_journey?
    @entry_station != nil
  end

  def minimum_balance?
    @balance < MINIMUM_BALANCE
  end
end
