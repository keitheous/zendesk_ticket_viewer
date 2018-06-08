require 'spec_helper'

RSpec.describe ZendeskApi do
  let(:default_zendesk_api) { ZendeskApi.new }

  describe '.initialize' do
    context 'using default authentication, without a param' do
      it 'returns basic_auth attribute with default authentication' do
        expect(default_zendesk_api.basic_auth)
          .to eq(
            :username => "keithchongwy@gmail.com",
            :password => 'spiceupyourlife'
          )
      end
    end

    context 'using custom authentication as param' do
      let(:custom_auth) { { :username => "donkeh@gmail.com", :password => 'kong' } }
      let(:custom_zendesk_api) { ZendeskApi.new(custom_auth) }

      it 'returns basic_auth attribute with custom authentication' do
        expect(custom_zendesk_api.basic_auth).to eq(custom_auth)
      end
    end
  end

  describe '#get_request' do
    context "using default url, without a param" do
      let(:zendesk_response) { default_zendesk_api.get_request }

      it 'returns response with next_page url' do
        expect(zendesk_response['next_page']).to eq(
          'https://keitheous.zendesk.com/api/v2/tickets.json?page=2'
        )
      end

      it 'returns response with exactly 100 tickets on page 1 (max per page)' do
        expect(zendesk_response['tickets'].size).to eq(100)
      end

      it 'returns response with count to indicate overall tickets sum' do
        expect(zendesk_response['count']).to eq(104)
      end
    end

    context "using default url, with page 2 as param" do
      let(:zendesk_response_page_2) { default_zendesk_api.get_request(:page => 2) }

      it 'returns response with next_page url' do
        expect(zendesk_response_page_2['next_page']).to eq(nil)
      end

      it 'returns response with exactly 4 tickets on page 2' do
        expect(zendesk_response_page_2['tickets'].size).to eq(4)
      end
    end

    context "using custom url (groups) as params" do
      let(:groups_url) { "https://keitheous.zendesk.com/api/v2/groups.json" }
      let(:zendesk_response) { default_zendesk_api.get_request(:url => groups_url) }

      it 'returns response for groups' do
        expect(zendesk_response.key?('groups')).to eq(true)
        expect(zendesk_response.key?('tickets')).to eq(false)
      end
    end
  end
end
