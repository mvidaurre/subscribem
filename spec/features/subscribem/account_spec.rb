require 'spec_helper'

feature Subscribem::Account do
  scenario "can be created with an owner" do
    params = {
      :name => "Test Account",
      :subdomain => "test",
      :owner_attributes => {
        :email => "user@example.com",
        :password => "password",
        :password_confirmation => "password"
      }
    }
    account = Subscribem::Account.create_with_owner(params)
    account.should be_persisted
    account.users.first.should == account.owner
  end

  it "cannot create an account without a subdomain" do
    account = Subscribem::Account.create_with_owner
    account.should_not be_valid
    account.users.should be_empty
  end
end