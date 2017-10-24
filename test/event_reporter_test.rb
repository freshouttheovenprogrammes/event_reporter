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

    assert_equal './lib/full_event_attendees.csv', event_reporter.filename
  end

  def test_that_its_searching_first_name
    event_reporter = EventReporter.new

    assert_equal "Allison", event_reporter.search(:first_name, "Allison")

  end

end
