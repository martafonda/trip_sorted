require 'spec_helper'

describe "tickets/new" do
  before(:each) do
    assign(:ticket, stub_model(Ticket,
      :origin => "MyString",
      :destination => "MyString",
      :transportation_type => "MyString",
      :transportation_id => "MyString",
      :seat => "MyString",
      :extra_information => "MyString"
    ).as_new_record)
  end

  it "renders new ticket form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tickets_path, "post" do
      assert_select "input#ticket_origin[name=?]", "ticket[origin]"
      assert_select "input#ticket_destination[name=?]", "ticket[destination]"
      assert_select "input#ticket_transportation_type[name=?]", "ticket[transportation_type]"
      assert_select "input#ticket_transportation_id[name=?]", "ticket[transportation_id]"
      assert_select "input#ticket_seat[name=?]", "ticket[seat]"
      assert_select "input#ticket_extra_information[name=?]", "ticket[extra_information]"
    end
  end
end
