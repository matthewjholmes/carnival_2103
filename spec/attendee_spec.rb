require './lib/ride'
require './lib/attendee'

RSpec.describe do

  it 'is an instance' do
    attendee = Attendee.new('Bob', 20)

    expect(attendee).to be_an_instance_of(Attendee)
  end

end
  
