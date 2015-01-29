require 'minitest/autorun'
require_relative 'person_class.rb'
require "pry"

class PersonTest < Minitest::Test
  
  #tests go here
  #Each test method should start with test_, ala:
  
  def test_simple_input_with_expected_integer_output
    cs = Person.new("Batman")
    assert_equal(0, cs.spend)
  end
  
  def test_add_postive_param_to_spend_method_with_expected_output
    cs = Person.new("Batman")
    assert_equal(5.50, cs.spend(5.50))
  end
  
  def test_add_negative_param_to_spend_method_with_expected_output
    cs = Person.new("Batman")
    assert_equal(5.50, cs.spend(-5.50))
  end
 
  def test_non_string_param_for_initialize_method
    cs = Person.new(Batman)
    refute_equal("Batman, 0", cs.show_instance_variable_values) 
  end
  
end

binding.pry 
  
