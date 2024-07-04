class Flight
  attr_reader :flight_number

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end

  private

  attr_accessor :database_handle

end

