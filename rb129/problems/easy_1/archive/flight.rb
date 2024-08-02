class Flight
  def initialize(flight_number)
    @flight_number = flight_number
    @database_handle = Database.init
  end
end