require "pry"

class Person
  
  attr_accessor :name, :spending_amount # need accessor because we're getting and setting via the other class
  
  def initialize(name)                # could add additional parameter of spending_amount=0) -- if parameter 
    @name = name                      # spending_amount is not provided at instantiation, then defaults to 0
    @spending_amount = 0
  end
  
  def spend(amount)
    @spending_amount += amount
  end
  
end
