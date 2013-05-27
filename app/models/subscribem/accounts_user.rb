module Subscribem
  class AccountsUser < ActiveRecord::Base
    belongs_to :account, :class_name => "Subscribem::Account"
    belongs_to :user, :class_name => "Subscribem::User"
    #attr_accessible :account_id, :user_id
  end
end
