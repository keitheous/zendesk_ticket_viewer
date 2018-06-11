class TicketsViewer
  TABLE_HEADER = { 'ID' => 6, 'Subject' => 41, 'Submitter' => 12 }.freeze
  attr_reader :page_sections

  def initialize(tickets, page_size = 25)
    @page_sections = tickets.each_slice(page_size).to_a
  end

  def display_page(input_page)
    page_section = input_page - 1

    print_header
    print_rows(page_section)
    print_footer(input_page)
  end

  private

  def print_header
    horizontal_line
    header_text
    horizontal_line
  end

  def horizontal_line
    puts "+======+========================================+=============+"
  end

  def header_text
    header_texts = []

    TABLE_HEADER.each { |word, space| header_texts << word_wrap(word, space) }

    print_row(header_texts)
  end

  def word_wrap(word, space)
    if word.to_s.length > space
      word.to_s.slice(0, space - 2) + ".."
    else
      word.to_s.ljust(space)
    end
  end

  def print_rows(page)
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

  def print_footer(current_page)
    horizontal_line
    page_indicator(current_page)
  end

  def page_indicator(page)
    puts "Page: #{page} of #{page_sections.size}"
  end
end
