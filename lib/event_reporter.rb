require_relative 'queue'
require 'csv'
require 'pry'

class EventReporter

  attr_reader :queue, :filename, :contents

  def initialize
    @queue    = []
    @filename = './lib/full_event_attendees.csv'
    @contents = contents
  end

  def load(filename = @filename)
    # will need more flexibility when coming to what files I can load.
    # ask about a splat on the arguement filename
      # if filename == empty
      #   filename == @filename
      # end
    @contents = CSV.open filename, headers: true,
    header_converters: :symbol
  end

  def find(attribute, criteria)
    found = false
    @contents.each do |row|
      if row[attribute.to_sym].downcase == criteria.to_s.downcase
        add_to_queue(row)
        found = true
      end
    end
    return found
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
    puts " LAST NAME  FIRST NAME  EMAIL  ZIPCODE  CITY  STATE  ADDRESS  PHONE"
    puts @queue
  end

end


=begin
So, will I need to seperate my queue methods into my queue class?
It makes sense to me to leave the queue initialized as empty in the event_reporter
and then make sure that event_reporter has access to queue (through requirements)
to be able to call the methods in queue.rb.
=end
