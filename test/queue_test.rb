require './lib/queue'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class QueueTest < Minitest::Test

  def test_that_it_has_any_previous_searches
    q = Queue.new

    assert_equal 1, queue.count
  end

end
