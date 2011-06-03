require 'spec_helper'

describe "messages/edit.html.erb" do
  before(:each) do
    @message = assign(:message, stub_model(Message,
      :message_text => "",
      :message_url => ""
    ))
  end

  it "renders the edit message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => messages_path(@message), :method => "post" do
      assert_select "input#message_message_text", :name => "message[message_text]"
      assert_select "input#message_message_url", :name => "message[message_url]"
    end
  end
end
