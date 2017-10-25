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

  def search(attribute, criteria)
    found = false
    @contents.each do |row|
      # this is parsing thru csv and returning "true" if condition is met
      # and "false if nothing met"
      if row[attribute.to_sym].downcase == criteria.to_s.downcase

        # If a result is found, I need to shovel the result into the queue.
        # Need a variable for found results

        queue << row
        found = true

        # return true
      end
    end
    return found
  end


end
