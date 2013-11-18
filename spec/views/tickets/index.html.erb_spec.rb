require 'spec_helper'

describe "tickets/index" do
  before(:each) do
    assign(:tickets, [
      stub_model(Ticket,
        :origin => "Origin",
        :destination => "Destination",
        :transportation_type => "Transportation Type",
        :transportation_id => "Transportation",
        :seat => "Seat",
        :extra_information => "Extra Information"
      ),
      stub_model(Ticket,
        :origin => "Origin",
        :destination => "Destination",
        :transportation_type => "Transportation Type",
        :transportation_id => "Transportation",
        :seat => "Seat",
        :extra_information => "Extra Information"
      )
    ])
  end

  it "renders a list of tickets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Origin".to_s, :count => 2
    assert_select "tr>td", :text => "Destination".to_s, :count => 2
    assert_select "tr>td", :text => "Transportation Type".to_s, :count => 2
    assert_select "tr>td", :text => "Transportation".to_s, :count => 2
    assert_select "tr>td", :text => "Seat".to_s, :count => 2
    assert_select "tr>td", :text => "Extra Information".to_s, :count => 2
  end
end
