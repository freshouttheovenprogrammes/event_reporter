require './lib/help'
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
    event_reporter.load

    assert "allison", event_reporter.find(:first_name, "allison")

    assert_equal "", event_reporter.queue_print
  end

  def test_that_queue_prints
    event_reporter = EventReporter.new

    refute event_reporter.queue.empty?
  end

end
