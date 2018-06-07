require 'spec_helper'

RSpec.describe ApiServiceController do
  let(:api)           { ZendeskApi.new }
  let(:ticket_master) { TicketMaster.new }
  let(:controller)    { ApiServiceController.new(ticket_master, api) }

  describe '.initialize' do
    it 'sets ticket_master attr' do
      expect(controller.ticket_master.class).to eq(TicketMaster)
      expect(controller.ticket_master.tickets).to eq({})
    end

    it 'sets api attr' do
      expect(controller.api.class).to eq(ZendeskApi)
    end
  end

  describe '#fetch_tickets' do
    before do
      controller.fetch_tickets
    end
    it 'assigns 104 tickets to ticket_master' do
      expect(controller.ticket_master.tickets.size).to eq(104)
    end
  end
end
