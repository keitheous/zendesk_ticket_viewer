require_relative 'tickets_viewer'

class Cli
  attr_reader :tickets, :tickets_viewer

  def initialize(tic_args, tic_viewer = TicketsViewer)
    @tickets = tic_args
    @tickets_viewer = tic_viewer.new(tickets.values)
  end

  def run
    loop do
      display_main_options

      case gets.chomp
      when 'e' then return exit_application
      when '1' then view_all_tickets
      when '2' then view_single_ticket
      else invalid_option
      end
    end
  end

  def view_all_tickets
    loop do
      display_all_tickets_options
      user_input = gets.chomp

      return previous_menu if user_input == 'e'
      if valid_page_section?(user_input.to_i)
        tickets_viewer.display_page(user_input.to_i)
      else
        invalid_option
      end
    end
  end

  def view_single_ticket
    loop do
      display_single_ticket_options
      user_input = gets.chomp

      return previous_menu if user_input == 'e'
      if valid_ticket?(user_input.to_i)
        display_ticket(user_input.to_i)
      else
        invalid_option
      end
    end
  end

  private

  def display_ticket(ticket_id)
    ticket = tickets[ticket_id]
    puts [
      "Ticket #{ticket.id}",
      "Subject: #{ticket.subject}",
      "Description: #{ticket.description}",
      "Submitter : #{ticket.submitter}",
      "created: #{ticket.created_at}"
    ].unshift("\n").join("\n")
  end

  def max_pages
    tickets_viewer.page_sections.size
  end

  def valid_ticket?(ticket_id)
    (1..tickets.size).cover?(ticket_id)
  end

  def valid_page_section?(page_section)
    (1..max_pages).cover?(page_section)
  end

  def display_main_options
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

  def display_all_tickets_options
    puts [
      '===============================================================',
      'Zendesk Ticket Viewer: Viewing All Tickets by Page',
      'Options:',
      'Press (e) to Return to Previous Menu',
      "Press (page number between 1-#{max_pages}) to View Page",
      '==============================================================='
    ].unshift("\n").join("\n")
  end

  def display_single_ticket_options
    puts [
      '===============================================================',
      'Zendesk Ticket Viewer: Viewing Single Ticket by Ticket ID',
      'Options:',
      'Press (e) to Return to Previous Menu',
      "Press (ticket ID number between 1-#{tickets.size}) to View Ticket",
      '==============================================================='
    ].unshift("\n").join("\n")
  end

  def exit_application
    puts "Hasta mañana, viva forever, mi amor.."
  end

  def previous_menu
    puts "Returning to the Main Menu"
  end

  def invalid_option
    puts "Eeekkkk!! Invalid Option. Please read carefully and try again"
  end
end
