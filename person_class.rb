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
    @name = name                       
    @spending_amount = 0
  end
  
  # Public: #spend
  # Updates the @spending_amount instance variable when the corresponding member @name
  #
  # Parameters:
  # amount - integer by which @spending_amount should increase
  #
  # Returns:
  # The new value of @spending_amount
  #
  # State Changes:
  # Changes the value of @spending_amount
  
  def spend(amount)
    @spending_amount += amount
  end
  
end
