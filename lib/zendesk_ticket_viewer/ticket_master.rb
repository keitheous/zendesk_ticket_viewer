require_relative 'ticket'

class TicketMaster
  attr_reader :tickets

  def initialize(tickets = {})
    @tickets = tickets
  end

  def collect_tickets(api_tickets)
    api_tickets.each do |api_ticket|
      tickets[api_ticket['id']] = Ticket.new(
        :id          => api_ticket['id'],
        :subject     => api_ticket['subject'],
        :description => api_ticket['description'],
        :created_at  => api_ticket['created_at'],
        :submitter   => api_ticket['submitter']
      )
    end
  end
end
