require_relative 'zendesk_api'
require_relative 'ticket_master'

class ApiServiceController
  attr_reader :ticket_master, :api
  def initialize(ticket_master = TicketMaster.new, api = ZendeskApi.new)
    @ticket_master = ticket_master
    @api = api
  end

  def fetch_tickets
    initial_response = obtain_tickets_from_response

    total_pages = response_pages(initial_response['count'])

    (2..total_pages).each { |page| obtain_tickets_from_response(page) } if total_pages > 1

    self
  end

  private

  def obtain_tickets_from_response(page = nil)
    response = call_api(page)

    ticket_master.collect_tickets(response['tickets'])

    response
  end

  def response_pages(response_count)
    (response_count / 100.00).ceil # maximum 100 tickets stored per page
  end

  def call_api(page)
    api.get_request(:page => page)
  end
end
