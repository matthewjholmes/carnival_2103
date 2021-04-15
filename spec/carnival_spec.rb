require './lib/carnival'
require './lib/attendee'
require './lib/ride'

RSpec.describe do

  it 'initializes' do
    jeffco_fair = Carnival.new("Jefferson County Fair")

    expect(jeffco_fair).to be_an_instance_of(Carnival)
  end

  it 'has attributes' do
    jeffco_fair = Carnival.new("Jefferson County Fair")

    expect(jeffco_fair.name).to eq("Jefferson County Fair")
    expect(jeffco_fair.rides).to eq([])
  end

  it 'adds rides to array' do
    jeffco_fair = Carnival.new("Jefferson County Fair")
    ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
    bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
    scrambler = Ride.new({name: 'Scrambler', cost: 15})
    jeffco_fair.add_ride(ferris_wheel)
    jeffco_fair.add_ride(bumper_cars)
    jeffco_fair.add_ride(scrambler)

    expect(jeffco_fair.rides).to eq([ferris_wheel, bumper_cars, scrambler])
  end

end



# bob = Attendee.new('Bob', 20)
# #=> #<Attendee:0x00007fe59507dc80...>
#
# sally = Attendee.new('Sally', 20)
# #=> #<Attendee:0x00007fe593ac3318...>
#
# bob.add_interest('Ferris Wheel')
#
# bob.add_interest('Bumper Cars')
#
# sally.add_interest('Scrambler')
#
# jeffco_fair.recommend_rides(bob)
# #=> [#<Ride:0x00007fe59506ede8...>, #<Ride:0x00007fe594851930...>]
#
# jeffco_fair.recommend_rides(sally)
# #=> [#<Ride:0x00007fe59314eb98...>]
