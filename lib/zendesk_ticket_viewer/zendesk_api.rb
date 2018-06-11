require 'httparty'

class ZendeskApi
  attr_reader :basic_auth

  def initialize(authentication = default_basic_auth)
    @basic_auth = authentication
  end

  def get_request(url_args = {})
    http_connection(url_builder(url_args[:url], url_args[:page]))
  end

  private

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

  def http_connection(url)
    HTTParty.get(url, :basic_auth => basic_auth)
  rescue *exceptions_list => e
    puts "Error: " + e.message
  end

  def exceptions_list
    [
      Net::HTTPBadResponse,
      Net::HTTPHeaderSyntaxError,
      Net::ProtocolError,
      Errno::ECONNRESET,
      Errno::EINVAL,
      Timeout::Error,
      EOFError,
      SocketError
    ]
  end
end
