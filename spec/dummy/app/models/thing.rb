class Thing < ActiveRecord::Base
  scoped_to_account
  attr_accessible :account, :name
end
