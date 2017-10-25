require './lib/event_reporter'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class EventReporterRunnerTest < Minitest::Test

  def test_that_it_exists
    event_reporter = EventReporter.new

    assert_instance_of EventReporter, event_reporter
  end

  def test_that_the_queue_can_be_reached
    q = Queue.new

    assert_instance_of Queue, q
  end

  def test_that_queue_is_empty
    event_reporter = EventReporter.new
    assert_equal [], event_reporter.queue
  end

  def test_that_it_can_read_csv_file
    event_reporter = EventReporter.new
    expected = event_reporter.load
    assert_instance_of CSV, expected
  end

  def test_that_its_searching_first_name_and_that_it_appears_in_downcase
    event_reporter = EventReporter.new
    # getting error which is posted after test class ends
    assert "allison", event_reporter.search(:first_name, "allison")

  end

end

=begin

1) Error:
EventReporterRunnerTest#test_that_its_searching_first_name_and_that_it_appears_in_downcase:
Errno::ENOENT: No such file or directory @ rb_sysopen - ./lib/full_event_attendees.csv
  /Users/zacharypalmquist/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/csv.rb:1282:in `initialize'
  /Users/zacharypalmquist/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/csv.rb:1282:in `open'
  /Users/zacharypalmquist/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/csv.rb:1282:in `open'
  /Users/zacharypalmquist/turing/1module/event_reporter/lib/event_reporter.rb:15:in `load'
  /Users/zacharypalmquist/turing/1module/event_reporter/lib/event_reporter.rb:20:in `search'
  ./test/event_reporter_test.rb:34:in `test_that_its_searching_first_name_and_that_it_appears_in_downcase'

2) Error:
EventReporterRunnerTest#test_that_it_can_read_csv_file:
Errno::ENOENT: No such file or directory @ rb_sysopen - ./lib/full_event_attendees.csv
  /Users/zacharypalmquist/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/csv.rb:1282:in `initialize'
  /Users/zacharypalmquist/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/csv.rb:1282:in `open'
  /Users/zacharypalmquist/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/csv.rb:1282:in `open'
  /Users/zacharypalmquist/turing/1module/event_reporter/lib/event_reporter.rb:15:in `load'
  ./test/event_reporter_test.rb:27:in `test_that_it_can_read_csv_file'

  its not clear to me why its not reading the filetype when I can check for the instance of CSV to no avail.
=end
