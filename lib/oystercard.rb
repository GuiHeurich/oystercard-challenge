require_relative 'journey'

class Oystercard

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1
MINIMUM_FARE = 3

attr_reader :balance, :exit_station, :list_of_journeys

  def initialize
    @balance = 0
    @journey
    @list_of_journeys = []
  end

  def top_up(money)
    raise "Maximum balance is £#{MAXIMUM_BALANCE}!" if allowed?(money)
    @balance += money
    return money
  end

  def touch_in(station, journey = Journey.new)
    raise "Minimum balance is £#{MINIMUM_BALANCE}!" if minimum_balance?
    @journey = journey
    @journey.start_journey(station)
  end

  def touch_out(station)
    deduct
    @journey.end_journey(station)
    @list_of_journeys.push("Entry station: #{@journey.entry_station}" => "Exit station: #{@journey.exit_station}")
  end

private

  def deduct
    @balance -= @journey.fare
    return @journey.fare
  end

  def allowed?(money)
    new_balance = @balance += money
    new_balance > MAXIMUM_BALANCE
  end

  def minimum_balance?
    @balance < MINIMUM_BALANCE
  end
end
