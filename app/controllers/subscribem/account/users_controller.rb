require_dependency "subscribem/application_controller"

module Subscribem
  class Account::UsersController < Subscribem::ApplicationController
    def new
      @user = Subscribem::User.new
    end
    def create
      account = Subscribem::Account.find_by_subdomain!(request.subdomain)
      @user = account.users.create(params[:user])
      force_authentication!(account, @user)
      flash[:success] = "You have signed up successfully."
      redirect_to root_path
    end
  end
end
