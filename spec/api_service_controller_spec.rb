require 'spec_helper'

RSpec.describe ApiServiceController do
  let(:zendesk_api)   { ZendeskApi.new }
  let(:ticket_master) { TicketMaster.new }
  let(:controller)    { ApiServiceController.new(zendesk_api, ticket_master) }

  describe '.initialize' do
    it 'sets ticket_master attr' do
      expect(controller.ticket_master.class).to eq(TicketMaster)
      expect(controller.ticket_master.tickets).to eq({})
    end

    it 'sets api attr' do
      expect(controller.zendesk_api.class).to eq(ZendeskApi)
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
