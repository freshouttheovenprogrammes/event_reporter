
require 'csv'
require 'pry'

class EventReporter


  attr_reader :queue, :filename

  def initialize
    @queue    = []
    @filename = './lib/full_event_attendees.csv'
    @attendees = []
  end

  def load(filename = @filename)
    contents = CSV.open filename, headers: true,
    header_converters: :symbol
    contents.each do |row|
      @attendees << row
    end
  end

  def find(attribute, criteria)
    queue_clear
    @attendees.map do |row|
      if row[attribute.to_sym].to_s.downcase == criteria.to_s.downcase
        @queue << row
      end
    end
  end

  def add_to_queue(row)
    @queue << row
  end

  def queue_count
    @queue.count
  end

  def queue_clear
    @queue.clear
  end

  def queue_print
    puts @queue
  end

end
