require_dependency "subscribem/application_controller"

module Subscribem
  class AccountsController < Subscribem::ApplicationController

    def new
      @account = Subscribem::Account.new
      @account.build_owner
    end

    def create
      @account = Subscribem::Account.create_with_owner(params[:account])
      if @account.valid?
        force_authentication!(@account.owner)
        @account.create_schema
        flash[:success] = "Your account has been successfully created."
        redirect_to subscribem.root_url(:subdomain => @account.subdomain)
      else
        flash[:error] = "Sorry, your account could not be created."
        render :new
      end
    end
  end
end
