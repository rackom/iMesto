require 'spec_helper'

describe "places/new.html.erb" do
  before(:each) do
    assign(:place, stub_model(Place,
      :name => "MyString",
      :vicinity => "MyString",
      :type => "MyString",
      :lat => 1.5,
      :lon => 1.5,
      :thumbnail => "MyString",
      :address => "MyString",
      :phoneNumber => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new place form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => places_path, :method => "post" do
      assert_select "input#place_name", :name => "place[name]"
      assert_select "input#place_vicinity", :name => "place[vicinity]"
      assert_select "input#place_type", :name => "place[type]"
      assert_select "input#place_lat", :name => "place[lat]"
      assert_select "input#place_lon", :name => "place[lon]"
      assert_select "input#place_thumbnail", :name => "place[thumbnail]"
      assert_select "input#place_address", :name => "place[address]"
      assert_select "input#place_phoneNumber", :name => "place[phoneNumber]"
      assert_select "textarea#place_description", :name => "place[description]"
    end
  end
end
