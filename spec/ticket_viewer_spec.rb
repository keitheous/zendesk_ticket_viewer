require 'spec_helper'
require 'pry'

RSpec.describe TicketsViewer do
  let(:ticket_master) { TicketMaster.new }
  before do
    tickets_response = JSON.parse(File.read("spec/fixtures/sample_ticket_response.json"))
    ticket_master.collect_tickets(tickets_response)
  end

  let(:tickets)        { ticket_master.tickets.values }

  let(:tickets_viewer) { TicketsViewer.new(tickets) }
  let(:customized_tickets_viewer) { TicketsViewer.new(tickets, 1) }

  describe '.initialize' do
    context 'with default 25 tickets per page size param' do
      it 'returns 1 page_sections' do
        expect(tickets_viewer.page_sections.size).to eq(1)
        expect(tickets_viewer.page_sections.class).to eq(Array)
      end

      it 'returns 1 page_sections *containing 2 tickets' do
        expect(tickets_viewer.page_sections[0].size).to eq(2)
        expect(tickets_viewer.page_sections[0][0].class).to eq(Ticket)
        expect(tickets_viewer.page_sections[0][1].class).to eq(Ticket)
      end
    end

    context 'with customize 1 tickets per page size param' do
      it 'returns 2 page_sections' do
        expect(customized_tickets_viewer.page_sections.size).to eq(2)
      end

      it 'returns first page_section containing 1 ticket' do
        expect(customized_tickets_viewer.page_sections.first.size).to eq(1)
      end

      it 'returns second page_section containing 1 ticket' do
        expect(customized_tickets_viewer.page_sections.last.size).to eq(1)
      end
    end
  end
end
