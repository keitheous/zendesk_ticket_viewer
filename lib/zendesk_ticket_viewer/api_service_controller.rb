require_relative 'zendesk_api'
require_relative 'ticket_master'
require 'pry'

class ApiServiceController
  attr_reader :ticket_master, :zendesk_api
  def initialize(zendesk_api = ZendeskApi.new, ticket_master = TicketMaster.new)
    @zendesk_api = zendesk_api
    @ticket_master = ticket_master
  end

  def fetch_tickets
    initial_response = api_call

    return nil if initial_response.nil?

    collect_tickets(initial_response['tickets'])

    total_pages = response_pages(initial_response['count'])

    fetch_additional_tickets(total_pages) if total_pages > 1

    self
  end

  private

  def api_call(page = nil)
    zendesk_api.get_request(:page => page)
  end

  def collect_tickets(ticket_response)
    ticket_master.collect_tickets(ticket_response)
  end

  def response_pages(response_count)
    (response_count / 100.00).ceil # maximum 100 tickets stored per page
  end

  def fetch_additional_tickets(max_page)
    (2..max_page).each { |page| collect_tickets(api_call(page)['tickets']) }
  end
end
