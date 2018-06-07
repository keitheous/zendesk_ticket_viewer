require 'spec_helper'

RSpec.describe TicketMaster do
  let(:tickets_response_json) { File.read("spec/mock_data/sample_ticket_response.json") }
  let(:tickets_response)      { JSON.parse(tickets_response_json) }

  let(:ticket_master)         { TicketMaster.new }

  describe '.initialize' do
    it 'creates an empty hash collection of tickets' do
      expect(ticket_master.tickets).to eq({})
      expect(ticket_master.tickets.class).to eq(Hash)
    end
  end

  describe '#collect_tickets' do
    before do
      ticket_master.collect_tickets(tickets_response)
    end

    it "accepts zendesk api ticket response as a parameter" do
      expect(tickets_response.class).to eq(Array)
    end

    it 'collects 2 Ticket Objects and store in tickets(attr) Hash' do
      expect(ticket_master.tickets.size).to eq(2)
      expect(ticket_master.tickets[1].class).to eq(Ticket)
      expect(ticket_master.tickets[2].class).to eq(Ticket)
    end
  end
end
