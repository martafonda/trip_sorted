require 'spec_helper'

describe "tickets/show" do
  before(:each) do
    @ticket = assign(:ticket, stub_model(Ticket,
      :origin => "Origin",
      :destination => "Destination",
      :transportation_type => "Transportation Type",
      :transportation_id => "Transportation",
      :seat => "Seat",
      :extra_information => "Extra Information"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Origin/)
    rendered.should match(/Destination/)
    rendered.should match(/Transportation Type/)
    rendered.should match(/Transportation/)
    rendered.should match(/Seat/)
    rendered.should match(/Extra Information/)
  end
end
