class Journey

MINIMUM_FARE = 3
PENALTY = 6

  attr_reader :entry_station, :exit_station

  def initialize
    @entry_station
    @exit_station
  end

  def start_journey(station)
    @entry_station = station
  end

  def end_journey(station)
    @exit_station = station
    fare
  end

  def fare
    if @entry_station == nil || @exit_station == nil
      PENALTY
    else
      @entry_station = nil
      MINIMUM_FARE
    end
  end

  def in_journey?
    @entry_station != nil
  end

end
