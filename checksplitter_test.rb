require 'minitest/autorun'
require_relative 'checksplitter_v2.rb'
require "pry"

class ChecksplitterTest < Minitest::Test
  
  #tests go here
  #Each test method should start with test_, ala:
  
  def test_simple_input_with_expected_integer_output
    cs = Checksplitter.new(5, 20, 5)
    assert_equal(1.2, cs.cost_per_person)
  end
  
  def test_negative_cost_with_expected_output
    cs = Checksplitter.new(-10, 10, 2)
    assert_equal(5.50, cs.cost_per_person)
  end
  
  def test_negative_group_num_with_expected_output
    cs = Checksplitter.new(5, 20, -5)
    assert_equal(1.2, cs.cost_per_person)
  end
  
  def test_negative_tip_with_expected_output
    cs = Checksplitter.new(10, -10, 2)
    assert_equal(5.50, cs.cost_per_person)
  end
  
  def test_input_vs_output_yoda_style
    cs = Checksplitter.new(10, 10, 2)
    refute_equal(6.50, cs.cost_per_person)
  end
  
  def test_string_input_with_expected_output
    cs = Checksplitter.new(5, "-20", 5)
    assert_equal(1.2, cs.cost_per_person)
  end
  
  def test_missing_two_initialize_params
    cs = Checksplitter.new(5)
    assert_equal(6, cs.cost_per_person)
  end
  
end

binding.pry 