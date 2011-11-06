require "test/unit"
require File.expand_path("../../src/roman")

class MyTest < Test::Unit::TestCase


  def test_simple
  assert_equal("I", Roman.new(1).to_s)
  assert_equal("II", Roman.new(2).to_s)
  assert_equal("III", Roman.new(3).to_s)
  assert_equal("IV", Roman.new(4).to_s)
  assert_equal("IX", Roman.new(9).to_s)
   end
  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

end