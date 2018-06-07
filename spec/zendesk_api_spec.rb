require 'spec_helper'

RSpec.describe ZendeskApi do
  let(:default_zendesk_api) { ZendeskApi.new }

  describe '.initialize' do
    context 'using default authentication, without a param' do
      it 'returns basic_auth attribute with default authentication' do
        expect(default_zendesk_api.basic_auth)
          .to eq(
            :username => "keithchongwy@gmail.com",
            :password => 'spiceupyourlife',
          )
      end
    end

    context 'using custom authentication as param' do
      let(:username_password)  { { :username => "donkeh@gmail.com", :password => 'kong' } }
      let(:custom_zendesk_api) { ZendeskApi.new(username_password) }

      it 'returns basic_auth attribute with custom authentication' do
        expect(custom_zendesk_api.basic_auth).to eq(username_password)
      end
    end
  end

  describe '#get_request' do
    context "using default url, without a param" do
      let(:default_response) { default_zendesk_api.get_request }

      it 'returns response for tickets' do
        expect(default_response.keys).to eq(
          ['tickets', 'next_page', 'previous_page', 'count']
        )
      end
    end

    context "using custom url (groups) as params" do
      let(:groups_url) { "https://keitheous.zendesk.com/api/v2/groups.json" }
      let(:default_response) { default_zendesk_api.get_request(groups_url) }

      it 'returns response for groups' do
        expect(default_response.keys).to eq(
          ["groups", "next_page", "previous_page", "count"]
        )
      end
    end
  end
end
