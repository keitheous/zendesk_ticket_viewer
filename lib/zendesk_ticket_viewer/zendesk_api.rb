require 'httparty'

class ZendeskApi
  attr_reader :basic_auth

  def initialize(auth_args = nil)
    @basic_auth = authentication(auth_args)
  end

  def get_request(url_args = {})
    HTTParty.get(
      url_builder(url_args[:url], url_args[:page]),
      :basic_auth => basic_auth
    )
  end

  private

  def authentication(auth_args)
    auth_args || default_basic_auth
  end

  def default_basic_auth
    { :username => "keithchongwy@gmail.com", :password => 'spiceupyourlife' }
  end

  def url_builder(url, page)
    return tickets_url + url_concat(page) if page

    url || tickets_url
  end

  def tickets_url
    'https://keitheous.zendesk.com/api/v2/tickets.json'
  end

  def url_concat(page_num)
    "?page=#{page_num}"
  end
end
