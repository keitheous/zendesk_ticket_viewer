require_relative 'ticket'

class TicketMaster
  attr_reader :tickets

  def initialize
    @tickets = {}
  end

  def collect_tickets(api_tickets)
    api_tickets.each do |api_ticket|
      tickets[api_ticket['id']] = Ticket.new(
        api_ticket['id'],
        api_ticket['subject'],
        api_ticket['description'],
        api_ticket['created_at'],
        api_ticket['submitter'],
      )
    end
  end
end
