require 'spec_helper'

RSpec.describe TicketMaster do
  let(:ticket_master)    { TicketMaster.new }
  let(:tickets_response) {
    JSON.load(File.read("spec/mock_data/sample_ticket_response.json"))
  }

  describe '.initialize' do
    it 'creates an empty hash collection of tickets' do
      expect(ticket_master.collections).to eq({})
      expect(ticket_master.collections.class).to eq(Hash)
    end
  end

  describe '#collect_tickets' do
    let(:result) { ticket_master.collect_tickets(tickets_response) }

    it "accepts zendesk api ticket response as a parameter" do
    end

    it 'generates 2 Ticket Objects to be stored in class attr collections' do

    end
  end
end
