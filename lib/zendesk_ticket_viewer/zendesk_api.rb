class ZendeskApi
  attr_reader :basic_auth

  def initialize(basic_auth = nil)
     @basic_auth = basic_auth || { :username => "keithchongwy@gmail.com", :password => 'spiceupyourlife' }
   end

  def get_request(url = nil)
    HTTParty.get( url || 'https://keitheous.zendesk.com/api/v2/tickets.json',
      :basic_auth => basic_auth)
  end
end
