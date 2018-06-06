class Ticket
  attr_reader :id, :subject, :description, :created_at, :submitter

  def initialize(id, subject, description, created_at, submitter)
    @id = id
    @subject = subject
    @description = description
    @created_at = created_at
    @submitter = submitter
  end
end
