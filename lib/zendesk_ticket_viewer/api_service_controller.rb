require_relative 'zendesk_api'
require_relative 'ticket_master'

class ApiServiceController
  attr_reader :ticket_master, :api
  def initialize(ticket_master, api)
    @ticket_master = ticket_master
    @api = api
  end

  def fetch_tickets
    response = api.get_request

    ticket_master.collect_tickets(response['tickets'])

    total_pages = (response['count'] / 100.00).ceil

    if total_pages > 1
      (2..total_pages).each do |page|
        response = api.get_request(:page => page)
        ticket_master.collect_tickets(response['tickets'])
      end
    end
  end
end
