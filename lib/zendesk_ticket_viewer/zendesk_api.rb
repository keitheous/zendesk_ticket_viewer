class ZendeskApi
  attr_reader :basic_auth

  def initialize(auth_args = nil)
     @basic_auth = authentication(auth_args)
   end

  def get_request(url = nil)
    HTTParty.get( url || 'https://keitheous.zendesk.com/api/v2/tickets.json',
      :basic_auth => basic_auth)
  end

  private

  def authentication(auth_args)
    auth_args || default_basic_auth
  end

  def default_basic_auth
    { :username => "keithchongwy@gmail.com", :password => 'spiceupyourlife' }
  end
end
