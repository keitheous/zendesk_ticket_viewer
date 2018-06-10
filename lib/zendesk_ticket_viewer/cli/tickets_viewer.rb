# require_relative '../api_service_controller'

class TicketsViewer
  TABLE_HEADER = { 'ID' => 6, 'Subject' => 40, 'Submitter' => 13 }.freeze
  PAGE_SIZE    = 25
  attr_reader :page_sections

  def initialize(tickets)
    @page_sections = tickets.each_slice(PAGE_SIZE).to_a
  end

  def print_header
    horizontal_line
    header_text
    horizontal_line
  end

  def display_page(page = 0)
    print_header
    ticket_rows(page)
    horizontal_line
  end

  private

  def horizontal_line
    puts "+======+========================================+=============+"
  end

  def header_text
    header_texts = []

    TABLE_HEADER.each { |word, space| header_texts << word_wrap(word, space) }

    print_row(header_texts)
  end

  def ticket_rows(page)
    page_sections[page].each do |ticket|
      row_texts = []
      row_texts << word_wrap(ticket.id, TABLE_HEADER['ID'])
      row_texts << word_wrap(ticket.subject, TABLE_HEADER['Subject'])
      row_texts << word_wrap(ticket.submitter, TABLE_HEADER['Submitter'])
      print_row(row_texts)
    end
  end

  def print_row(row)
    puts '|' + row.join('|') + '|'
  end

  def word_wrap(word, space)
    if word.to_s.length >= space
      word.to_s.slice(0, space - 3) + "..."
    else
      word.to_s.ljust(space)
    end
  end
end

# TicketsViewer.new(
#   ApiServiceController.new.fetch_tickets.ticket_master.tickets.values
# ).display_page
#
# TicketsViewer.new(
#   ApiServiceController.new.fetch_tickets.ticket_master.tickets.values
# ).display_page(1)
#
# TicketsViewer.new(
#   ApiServiceController.new.fetch_tickets.ticket_master.tickets.values
# ).display_page(2)
#
# TicketsViewer.new
#   ApiServiceController.new.fetch_tickets.ticket_master.tickets.values
# ).display_page(3)
#
# TicketsViewer.new(
#   ApiServiceController.new.fetch_tickets.ticket_master.tickets.values
# ).display_page(4)
