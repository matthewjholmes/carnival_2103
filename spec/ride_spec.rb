require './lib/ride'
require './lib/attendee'

RSpec.describe do

  it 'is an instance' do
    ride = Ride.new({name: 'Ferris Wheel', cost: 0})

    expect(ride).to be_an_instance_of(Ride)
  end

  it 'has attributes' do
    ride = Ride.new({name: 'Ferris Wheel', cost: 0})

    expect(ride.name).to eq('Ferris Wheel')
    expect(ride.cost).to eq(0)
  end
end


# ride = Ride.new({name: 'Ferris Wheel', cost: 0})
#
#
# ride.name
#
#
# ride.cost
#
#
# attendee = Attendee.new('Bob', 20)
#
#
# attendee.name
#
#
# attendee.spending_money
#
#
# attendee.interests
#
#
# attendee.add_interest('Bumper Cars')
#
# attendee.add_interest('Ferris Wheel')
#
# attendee.interests
