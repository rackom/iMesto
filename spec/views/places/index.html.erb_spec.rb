require 'spec_helper'

describe "places/index.html.erb" do
  before(:each) do
    assign(:places, [
      stub_model(Place,
        :name => "Name",
        :vicinity => "Vicinity",
        :type => "Type",
        :lat => 1.5,
        :lon => 1.5,
        :thumbnail => "Thumbnail",
        :address => "Address",
        :phoneNumber => "Phone Number",
        :description => "MyText"
      ),
      stub_model(Place,
        :name => "Name",
        :vicinity => "Vicinity",
        :type => "Type",
        :lat => 1.5,
        :lon => 1.5,
        :thumbnail => "Thumbnail",
        :address => "Address",
        :phoneNumber => "Phone Number",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of places" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Vicinity".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Thumbnail".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
