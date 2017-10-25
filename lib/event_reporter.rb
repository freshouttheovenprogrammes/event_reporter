require_relative 'queue'
require 'csv'

class EventReporter

  attr_reader :queue, :filename, :contents

  def initialize
    @queue    = []
    @filename = './lib/full_event_attendees.csv'
    @contents = contents
  end

  def load(filename = @filename)
    contents = CSV.open filename, headers: true,
    header_converters: :symbol
  end

  def search(attribute, criteria)
    load.each do |row|
      result = row([attribute.to_sym][criteria.to_sym]).downcase
      # here I'm wanting it to first iterate through the csv thats been established and found in the load method
      # then I'm trying to pull a result that depends on the arguements attribute and criteria which I've converted into :symbols
    end
    return result
  end


end
