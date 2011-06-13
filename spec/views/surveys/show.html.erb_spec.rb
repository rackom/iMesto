require 'spec_helper'

describe "surveys/show.html.erb" do
  before(:each) do
    @survey = assign(:survey, stub_model(Survey,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
