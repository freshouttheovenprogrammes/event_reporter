require_relative 'queue'

class EventReporter

  attr_reader :queue, :filename

  def initialize
    @queue    = []
    @filename = './lib/full_event_attendees.csv'
  end

  def load(filename = @filename)
    contents = CSV.open filename, headers: true,
    header_converters: :symbol
  end

  def search(attribute, criteria)
    result = contents.each do |row|
      row([attribute.to_sym][criteria.to_sym]).downcase
    end
    return row.capitalize
  end


end
