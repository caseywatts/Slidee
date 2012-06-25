require 'spec_helper'

describe "home page" do
  it "displays the user's username after successful login" do
    user = FactoryGirl.create(:user)
    CASClient::Frameworks::Rails::Filter.fake(user.login)
    binding.pry
    get "/"

    assert_select ".login_status", :text => user.first_name + " " + user.last_name
  end
end
