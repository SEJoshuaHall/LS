class Person
  attr_reader :name
  attr_accessor :location

  def initialize(name)
    @name = name
  end

  def teleport_to(latitude, longitude)
    @location = GeoLocation.new(latitude, longitude)
  end
end

class GeoLocation
  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end
  
  def to_s
    "(#{latitude}, #{longitude})"
  end
  
  def ==(other)
    latitude == other.latitude &&
    longitude == other.longitude
  end

  protected

  attr_reader :latitude, :longitude

end

# Example

ada = Person.new('Ada')
ada.location = GeoLocation.new(53.477, -2.236)

grace = Person.new('Grace')
grace.location = GeoLocation.new(-33.89, 151.277)

ada.teleport_to(-33.89, 151.277)

puts ada.location                   # (-33.89, 151.277)
puts grace.location                 # (-33.89, 151.277)
puts ada.location == grace.location # expected: true
                                    # actual: false