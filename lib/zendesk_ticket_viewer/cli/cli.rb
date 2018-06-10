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

      case user_input
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
      choice = user_input

      return previous_menu if choice == 'e'
      if valid_page_section?(choice.to_i)
        display_page(choice.to_i)
      else
        invalid_option
      end
    end
  end

  def view_single_ticket(display_single_ticket = 'single ticket')
    puts display_single_ticket
  end

  private

  def display_page(page)
    tickets_viewer.display_page(page)
  end

  def max_pages
    tickets_viewer.page_sections.size
  end

  def valid_page_section?(page_section)
    (1..max_pages).cover?(page_section)
  end

  def user_input
    gets.chomp
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
      "Press (any number between 1-#{max_pages}) to View Pages",
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
