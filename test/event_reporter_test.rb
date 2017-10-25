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
    expected = event_reporter.load

    assert event_reporter.find(:first_name, "allison")
  end

  def test_first_name_search_finds_something_other_than_first_result_in_file
    event_reporter = EventReporter.new
    expected = event_reporter.load

    assert event_reporter.find(:first_name, "aya")
  end

  def test_last_name_search_finds_last_name_deep_in_csv_file
    event_reporter = EventReporter.new
    expected = event_reporter.load

    assert event_reporter.find(:last_name, "Baimas-George")
  end

  def test_that_its_searching_first_name_and_that_it_doesnt_appear
    event_reporter = EventReporter.new
    expected = event_reporter.load

    refute event_reporter.find(:first_name, "yves")
  end

  def test_that_finding_state
      event_reporter = EventReporter.new
      event_reporter.load

      assert event_reporter.find(:state, "CA")
  end

  def test_that_queue_holds_data_from_search
    event_reporter = EventReporter.new
    event_reporter.load
    event_reporter.find(:first_name, "allison")

    refute event_reporter.queue.empty?
  end

  def test_that_the_queue_can_be_counted
    # queue = Queue.new
    event_reporter = EventReporter.new
    event_reporter.load
    event_reporter.find(:first_name, "mary")
    assert_equal 16, event_reporter.queue.count
  end

  def test_that_queue_can_be_cleared
    event_reporter = EventReporter.new
    event_reporter.load
    event_reporter.find(:first_name, "mary")
    event_reporter.queue.clear

    assert event_reporter.queue.empty?
  end

  def test_what_printed_queue_looks_like
    event_reporter = EventReporter.new
    event_reporter.load
    event_reporter.find(:first_name, "mary")


    assert_equal "", event_reporter.queue_print
  end

end
