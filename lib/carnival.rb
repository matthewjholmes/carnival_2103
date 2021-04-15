class Carnival

  attr_reader :name, :rides, :attendees

  def initialize(name)
    @name = name
    @rides = []
    @attendees = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def recommend_rides(attendee)
    attendee.interests
  end

  def admit(attendee)
    @attendees << attendee
  end

end
