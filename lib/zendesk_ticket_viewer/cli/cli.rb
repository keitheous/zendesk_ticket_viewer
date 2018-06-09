class Cli
  attr_reader :tickets

  def initialize(tic_args)
    @tickets = tic_args
  end

  def run
    loop do
      display_instruction

      case user_input
      when 'e' then return exit_application
      when '1' then view_all_tickets
      when '2' then view_single_ticket
      else invalid_option
      end
    end
  end

  def view_all_tickets(display_all_tickets = 'viewing all tickets')
    puts display_all_tickets
  end

  def view_single_ticket(display_single_ticket = 'single ticket')
    puts display_single_ticket
  end

  private

  def user_input
    gets.chomp
  end

  def display_instruction
    puts [
      '============================================================',
      'Zendesk Ticket Viewer',
      'Options:',
      '1 => View all tickets',
      '2 => View single ticket',
      'e => Exit',
      '============================================================'
    ].unshift("\n").join("\n")
  end

  def exit_application
    puts "Hasta mañana, viva forever, mi amor.."
  end

  def invalid_option
    puts "Eeekkkk!! Invalid Option. Try again"
  end
end

# tickets = {1=> 'Beyonce', 2=> 'Adele'}
# Cli.new(tickets).run
