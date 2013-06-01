Rails.application.config.middleware.use 'Apartment::Elevators::Subdomain'


Apartment.configure do |config|
  config.excluded_models = ["Subscribem::Account",
                             "Subscribem::AccountsUser",
                             "Subscribem::User"]
  # Dynamically get database names to migrate
  # config.database_names = lambda{ Account.pluck(:database_name) }
end