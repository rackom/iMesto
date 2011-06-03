require 'spec_helper'

describe "messages/index.html.erb" do
  before(:each) do
    assign(:messages, [
      stub_model(Message,
        :message_text => "",
        :message_url => ""
      ),
      stub_model(Message,
        :message_text => "",
        :message_url => ""
      )
    ])
  end

  it "renders a list of messages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
