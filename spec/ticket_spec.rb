require 'spec_helper'

RSpec.describe Ticket do
  let(:ticket) {
    Ticket.new(
      12,
      'Cat in a Tree',
      'Help! my Cat is stuck in a tree',
      '2018-06-05T03:58:57Z',
      123456,
    )
  }

  describe '.initialize' do
    it 'has an ID' do
      expect(ticket.id).to eq(12)
    end

    it 'has a subject' do
      expect(ticket.subject).to eq('Cat in a Tree')
    end

    it 'has a description' do
      expect(ticket.description).to eq('Help! my Cat is stuck in a tree')
    end

    it 'has a created_at date' do
      expect(ticket.created_at).to eq('2018-06-05T03:58:57Z')
    end

    it 'has a submitter' do
      expect(ticket.submitter).to eq(123456)
    end
  end
end
