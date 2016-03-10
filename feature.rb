# should just make sure it passes all of the user stories

# if you were the user, how would you use this code?

require './lib/airport'
require './lib/plane'
require './lib/weather'

airport = Airport.new

plane1 = Plane.new
p plane2 = Plane.new

weather = Weather.new

airport.instruct_to_land(weather, plane1)

# airport.instruct_takeoff(weather, plane1)

airport.instruct_to_land(weather, plane2)

p airport.storage
