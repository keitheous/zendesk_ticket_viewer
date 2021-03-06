class Ticket
  attr_reader :id, :subject, :description, :created_at, :submitter

  def initialize(args)
    @id          = args[:id]
    @subject     = args[:subject]
    @description = args[:description]
    @created_at  = args[:created_at]
    @submitter   = args[:submitter]
  end

  def to_s
    [
      "Ticket #{id}",
      "Subject    : #{subject}",
      "Submitter  : #{submitter}",
      "Created    : #{created_at}",
      "Description:\n#{description}"
    ].join("\n")
  end
end
