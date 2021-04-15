require './lib/ride'
require './lib/attendee'

RSpec.describe do

    it 'is an instance' do
      attendee = Attendee.new('Bob', 20)

      expect(attendee).to be_an_instance_of(Attendee)
    end

    it 'has attributes' do
      attendee = Attendee.new('Bob', 20)

      expect(attendee.name).to eq('Bob')
      expect(attendee.spending_money).to eq(20)

    end

    it 'has empty interests array' do
      attendee = Attendee.new('Bob', 20)

      expect(attendee.interests).to eq([])
    end
  end

  # attendee.add_interest('Ferris Wheel')
  #
  # attendee.interests
