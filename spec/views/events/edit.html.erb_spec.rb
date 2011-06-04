require 'spec_helper'

describe "events/edit.html.erb" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :name => "MyString",
      :description => "MyText",
      :address => "MyString",
      :lat => "",
      :lon => ""
    ))
  end

  it "renders the edit event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => events_path(@event), :method => "post" do
      assert_select "input#event_name", :name => "event[name]"
      assert_select "textarea#event_description", :name => "event[description]"
      assert_select "input#event_address", :name => "event[address]"
      assert_select "input#event_lat", :name => "event[lat]"
      assert_select "input#event_lon", :name => "event[lon]"
    end
  end
end
