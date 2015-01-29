require "pry"

# Class: Person
#
# Creates groups of diners with names and cashdollars. 
#
# Attributes:
# @name            - Instance variable: represents the member's name
# @spending_amount - Instance variable: represents the member's current balance (initialized to 0)
#
# Public Methods:
# #spend
# #show_instance_variable_values

class Person
  
  # Private?: #initialize
  # Establishes primary instance variables when you instantiate the class.
  #
  # Parameters:
  # name - name of the member who's joining
  #
  # Returns:
  # the value of @name and @spending_amount
  #
  # State Changes:
  # Sets @name and @spending_amount
  
  attr_accessor :name, :spending_amount 
  
  def initialize(name)                
    @name = name.to_s                       
    @spending_amount = 0
  end
  
  
  # Public: #show_instance_variable_values
  # Outputs the values for @name and @spending_amount
  #
  # Parameters:
  # None
  #
  # Returns:
  # nil
  #
  # State Changes:
  # None
  
  def show_instance_variable_values
    puts "#{@name}, #{@spending_amount}"
  end  
    
  # Public: #spend
  # Updates the @spending_amount instance variable for the corresponding member @name
  #
  # Parameters:
  # amount - integer by which @spending_amount should increase
  #
  # Returns:
  # The new value of @spending_amount
  #
  # State Changes:
  # Changes the value of @spending_amount
  
  def spend(amount=0)
    @spending_amount += amount.to_f.abs
  end
  
end

binding.pry