task :default => [:run]

desc "request tickets from Zendesk API and display 'em in groups or individually"

task "run" do
  $LOAD_PATH.unshift(File.dirname(__FILE__), "lib")
  require 'zendesk_ticket_viewer/api_service_controller'
  require 'zendesk_ticket_viewer/cli/cli'

  puts "Welcome To Zendesk Ticket Viewer"

  puts "Requesting tickets from Zendesk API ..."
  zendesk_api = ZendeskApi.new
  api_service = ApiServiceController.new(zendesk_api).fetch_tickets

  next if api_service.nil?

  tickets = api_service.ticket_master.tickets

  puts "Loading tickets into CLI ..."
  Cli.new(tickets).run
end
