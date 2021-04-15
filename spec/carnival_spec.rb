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

  it 'adds recommended rides based on attendee interests' do
    jeffco_fair = Carnival.new("Jefferson County Fair")
    bob = Attendee.new('Bob', 20)
    sally = Attendee.new('Sally', 20)
    bob.add_interest('Ferris Wheel')
    bob.add_interest('Bumper Cars')
    sally.add_interest('Scrambler')

    expect(jeffco_fair.recommend_rides(bob)).to eq (['Ferris Wheel', 'Bumper Cars'])
    expect(jeffco_fair.recommend_rides(sally)).to eq (['Scrambler'])
  end

  it 'has empty attendees array' do
    jeffco_fair = Carnival.new("Jefferson County Fair")

    expect(jeffco_fair.attendees).to eq([])
  end

  it 'admits new attendees' do
    jeffco_fair = Carnival.new("Jefferson County Fair")
    bob = Attendee.new("Bob", 0)
    bob.add_interest('Ferris Wheel')
    bob.add_interest('Bumper Cars')
    sally = Attendee.new('Sally', 20)
    sally.add_interest('Bumper Cars')
    johnny = Attendee.new("Johnny", 5)
    johnny.add_interest('Bumper Cars')
    jeffco_fair.admit(bob)
    jeffco_fair.admit(sally)
    jeffco_fair.admit(johnny)

    expect(jeffco_fair.attendees).to eq([bob, sally, johnny])
  end

  it 'lists attendees by ride interest' do
    jeffco_fair = Carnival.new("Jefferson County Fair")
    bob = Attendee.new("Bob", 0)
    bob.add_interest('Ferris Wheel')
    bob.add_interest('Bumper Cars')
    sally = Attendee.new('Sally', 20)
    sally.add_interest('Bumper Cars')
    johnny = Attendee.new("Johnny", 5)
    johnny.add_interest('Bumper Cars')
    jeffco_fair.admit(bob)
    jeffco_fair.admit(sally)
    jeffco_fair.admit(johnny)

    expect(jeffco_far.attendees_by_ride_interest).to eq ({:ferris_wheel => [bob], :bumper_cars => [bob, sally, johnny], :scrambler => []})
  end
end
