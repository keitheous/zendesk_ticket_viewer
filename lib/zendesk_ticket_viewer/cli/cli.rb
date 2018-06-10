require_relative 'tickets_viewer'

class Cli
  attr_reader :tickets, :tickets_viewer

  def initialize(tickets_hash, tic_viewer = TicketsViewer)
    @tickets = tickets_hash
    @tickets_viewer = tic_viewer.new(tickets.values)
  end

  def run
    loop do
      main_instructions

      case gets.chomp
      when 'e' then return exit_application
      when '1' then view('all')
      when '2' then view('single_ticket')
      else invalid_option
      end
    end
  end

  def view(mode)
    loop do
      sub_options(mode)
      user_input = gets.chomp

      return previous_menu if user_input == 'e'

      if valid_range?(user_input.to_i, max_range(mode))
        display_content(mode, user_input.to_i)
      else
        invalid_option
      end
    end
  end

  private

  def max_range(mode)
    mode == 'all' ? max_pages : tickets.size
  end

  def sub_options(mode)
    mode == 'all' ? list_tickets_options : list_single_ticket_options
  end

  def display_content(mode, user_input)
    mode == 'all' ? display_page(user_input) : display_ticket(user_input)
  end

  def display_page(page)
    tickets_viewer.display_page(page)
  end

  def max_pages
    tickets_viewer.page_sections.size
  end

  def valid_range?(user_input, max_range)
    (1..max_range).cover?(user_input)
  end

  def main_instructions
    puts [
      '===============================================================',
      'Zendesk Ticket Viewer: Main Menu',
      'Options:',
      'Press (e) to Exit',
      'Press (1) to View all tickets',
      'Press (2) to View single ticket',
      '==============================================================='
    ].unshift("\n").join("\n")
  end

  def list_tickets_options
    puts [
      '===============================================================',
      'Zendesk Ticket Viewer: Viewing All Tickets by Page',
      'Options:',
      'Press (e) to Return to Previous Menu',
      "Press (page number between 1-#{max_pages}) to View Page",
      '==============================================================='
    ].unshift("\n").join("\n")
  end

  def list_single_ticket_options
    puts [
      '===============================================================',
      'Zendesk Ticket Viewer: Viewing Single Ticket by Ticket ID',
      'Options:',
      'Press (e) to Return to Previous Menu',
      "Press (ticket ID number between 1-#{tickets.size}) to View Ticket",
      '==============================================================='
    ].unshift("\n").join("\n")
  end

  def display_ticket(ticket_id)
    ticket = tickets[ticket_id]

    puts [
      "Ticket #{ticket.id} / #{tickets.size}",
      "Subject: #{ticket.subject}",
      "Submitter: #{ticket.submitter}",
      "Created: #{ticket.created_at}",
      "Description:\n#{ticket.description}"
    ].unshift("\n").join("\n")
  end

  def exit_application
    puts "Hasta mañana, viva forever, mi amor.."
  end

  def previous_menu
    puts "Returning to the Main Menu"
  end

  def invalid_option
    puts "Eeekkkk!! Invalid Option. Please read carefully and try again =)"
  end
end

# require_relative '../api_service_controller'
# tickets = ApiServiceController.new.fetch_tickets.ticket_master.tickets
# Cli.new(tickets).run
