class Airport

  attr_reader :storage

  def initialize
    @storage = []
  end

  def airport_full?
    @storage.length > 10 ? true : false
  end

  def instruct_to_land(weather, plane)
    raise "Airport full." if airport_full?
    raise "Too stormy." if weather.is_stormy?
    plane.land
    @storage << plane
  end

  def instruct_takeoff(weather, plane)
    raise "Too stormy." if weather.is_stormy?
    plane.takeoff
    @storage.delete(plane)
  end

end
