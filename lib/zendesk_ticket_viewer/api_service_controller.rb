require_relative 'zendesk_api'
require_relative 'ticket_master'

class ApiServiceController
  attr_reader :ticket_master, :api
  def initialize(ticket_master, api)
    @ticket_master = ticket_master
    @api = api
  end

  def fetch_tickets
    response = api_call

    ticket_master.collect_tickets(response['tickets'])

    total_pages = response_pages_for_tickets(response['count'])

    if total_pages > 1
      (2..total_pages).each do |page|
        response = api_call(page)
        ticket_master.collect_tickets(response['tickets'])
      end
    end
  end

  private

  def response_pages_for_tickets(response_count)
    (response_count / 100.00).ceil
  end

  def api_call(page = nil)
    api.get_request(:page => page)
  end
end
