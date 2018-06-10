class TicketsViewer
  TABLE_HEADER = { 'ID' => 6, 'Subject' => 40, 'Submitter' => 13 }.freeze
  attr_reader :page_sections, :table_header

  def initialize(tickets, page_size = 25)
    @page_sections = tickets.each_slice(page_size).to_a
  end

  def display_page(input_page)
    page_section = input_page - 1

    print_header
    ticket_rows(page_section)
    page_indicator(input_page)
  end

  private

  def default_page_size(custom_page_size = nil)
    custom_page_size || 25
  end

  def print_header
    horizontal_line
    header_text
    horizontal_line
  end

  def page_indicator(page)
    horizontal_line
    puts "Page: #{page} of #{page_sections.size}"
  end

  def horizontal_line
    puts "+======+========================================+=============+"
  end

  def header_text
    header_texts = []

    TABLE_HEADER.each { |word, space| header_texts << word_wrap(word, space) }

    print_row(header_texts)
  end

  def ticket_rows(page)
    page_sections[page].each { |ticket| print_row(row_builder(ticket)) }
  end

  def row_builder(ticket)
    row_texts = []
    row_texts << word_wrap(ticket.id, TABLE_HEADER['ID'])
    row_texts << word_wrap(ticket.subject, TABLE_HEADER['Subject'])
    row_texts << word_wrap(ticket.submitter, TABLE_HEADER['Submitter'])
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
