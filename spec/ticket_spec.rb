require 'spec_helper'

RSpec.describe Ticket do
  let(:ticket_args) { {} }

  before do
    ticket_args[:id]          = 12
    ticket_args[:subject]     = 'Cat in a Tree'
    ticket_args[:description] = 'Help! my Cat is stuck in a tree'
    ticket_args[:created_at]  = '2018-06-05T03:58:57Z'
    ticket_args[:submitter]   = 123456
  end

  let(:ticket) { Ticket.new(ticket_args) }

  describe '.initialize' do
    it 'sets an ID' do
      expect(ticket.id).to eq(12)
    end

    it 'sets a subject' do
      expect(ticket.subject).to eq('Cat in a Tree')
    end

    it 'sets a description' do
      expect(ticket.description).to eq('Help! my Cat is stuck in a tree')
    end

    it 'sets a created_at date' do
      expect(ticket.created_at).to eq('2018-06-05T03:58:57Z')
    end

    it 'sets a submitter' do
      expect(ticket.submitter).to eq(123456)
    end
  end
end
