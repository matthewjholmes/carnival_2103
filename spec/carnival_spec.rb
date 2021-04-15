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
end

# def admit(attendee)
#   @attendees << attendee
# end


#
# pry(main)> jeffco_fair.attendees
# #=> [#<Attendee:0x00007ffab70bfce8...>, #<Attendee:0x00007ffab69069e8...>, #<Attendee:0x00007ffab7172d70...>]
#
# #Attendees are added even if they don't have enough money for all/any exhibits.
#
# pry(main)> jeffco_fair.attendees_by_ride_interest
# #=> {
# #    #<Ride:0x00007ffab5a3d3a8...> => [#<Attendee:0x00007ffab70bfce8...>],
# #    #<Ride:0x00007ffab714bce8...> => [#<Attendee:0x00007ffab70bfce8...>, #<Attendee:0x00007ffab69069e8...>, #<Attendee:0x00007ffab7172d70...>],
# #    #<Ride:0x00007ffab71607d8...> => []
# #  }
#
# pry(main)> jeffco_fair.ticket_lottery_contestants(bumper_cars)
# #=> [#<Attendee:0x00007ffab70bfce8...>, #<Attendee:0x00007ffab7172d70...>]
#
# pry(main)> jeffco_fair.draw_lottery_winner(bumper_cars)
# #=> "Johnny"
#
# #In the above method, with this setup, "Johnny" or "Bob" could be returned here - Fun!
#
# pry(main)> jeffco_fair.draw_lottery_winner(ferris_wheel)
# #=> nil
#
# #If no contestants are eligible for the lottery, nil is returned.
#
# pry(main)> jeffco_fair.announce_lottery_winner(scrambler)
# #=> "Bob has won the IMAX exhibit"
#
# #We realize that, in this setup, Bob is not interested in the scrambler.  However, in your test, the result should match exactly.  You will need to stub the return of `draw_lottery_winner` as the above method should depend on that method :)
#
# pry(main)> jeffco_fair.announce_lottery_winner(ferris_wheel)
# #=> "No winners for this lottery"
#
# #If there are no contestants, there are no winners.
