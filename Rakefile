task :default => [:run]

desc "request tickets from Zendesk API and display 'em in groups or individually"

task "run" do
  $LOAD_PATH.unshift(File.dirname(__FILE__), "lib")
  require 'zendesk_ticket_viewer/api_service_controller'
  require 'zendesk_ticket_viewer/cli/cli'

  puts "Requesting tickets from Zendesk API ..."
  tickets = ApiServiceController.new.fetch_tickets

  puts "Loading tickets into CLI ..."
  Cli.new(tickets).run
end
