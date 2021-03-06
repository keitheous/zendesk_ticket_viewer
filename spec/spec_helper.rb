require 'json'
require 'httparty'
require "bundler/setup"
require "zendesk_ticket_viewer"

require "zendesk_ticket_viewer/cli/tickets_viewer"
require 'zendesk_ticket_viewer/api_service_controller'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
