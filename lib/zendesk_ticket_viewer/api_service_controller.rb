require_relative 'zendesk_api'
require_relative 'ticket_master'

class ApiServiceController
  attr_reader :ticket_master, :api
  def initialize(ticket_master, api)
    @ticket_master = ticket_master
    @api = api
  end

  def fetch_tickets
    initial_response = obtain_tickets_from_response

    total_pages = response_pages_for_tickets(initial_response['count'])

    if total_pages > 1
      (2..total_pages).each { |page| obtain_tickets_from_response(page) }
    end
  end

  private

  def obtain_tickets_from_response(page = nil)
    response = call_api(page)

    ticket_master.collect_tickets(response['tickets'])

    response
  end

  def response_pages_for_tickets(response_count)
    (response_count / 100.00).ceil
  end

  def call_api(page)
    api.get_request(:page => page)
  end
end
