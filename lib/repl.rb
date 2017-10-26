require './lib/event_reporter'
require 'pry'

puts "Event Reporter Initialized"

class Repl
  e = EventReporter.new

  loop do
    $stdout.print '-> '
    line = $stdin.gets.chomp
    l = line.split(" ")
      if l[0] == "load"
        e.load
      elsif l[0] == "find"
        e.find(l[1], l[2])
      elsif l[0] == "find" && l[2] == "zipcode"
        e.find.clean_zipcodes
      elsif l[0] == "queue" && l[1] == "count"
        puts e.queue_count
      elsif
        l == ["queue", "print"]
        puts e.queue_print
      elsif
        l == ["queue", "clear"]
        e.queue_clear
      end
      break if l == ["exit"] || l == ["!!!"]
  end

end
