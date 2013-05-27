Warden::Strategies.add(:password) do
  def subdomain
    ActionDispatch::Http::URL.extract_subdomains(request.host, 1)
  end
  
  def valid?
    subdomain.present? && params['user']
  end
  
  def authenticate!
    account = Subscribem::Account.find_by_subdomain(subdomain)
    if account
      u = account.find_by_email(params["user"]["email"])
      if u.nil?
        fail!
      else
        if u.authenticate(params["user"]["password"])
          success!(u)
        else
          fail!
        end
      end
    end
  end
end