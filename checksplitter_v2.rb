require "pry"

# Class: Checksplitter
#
# Takes input about a cost and divides it by a specified number of payees.
#
# Attributes:
# @total_cost     - Instance variable: Represents the total cost of the meal
# @tip_percentage - Instance variable: Represents how much the group wants to tip
# @group_num      - Instance variable: Represents how many people attended the meal
#
# Public Methods:
# #cost_per_person


class Checksplitter
  
  # Private?: #initialize
  # Establishes primary instance variables when you create a new instance of the class.
  #
  # Parameters:
  # total_cost     - Total cost of the outing
  # tip_percentage - Tip percentage the group wants to leav
  # group_num      - Number of members who attended
  # 
  #
  # Returns:
  # The memory location of the new instance of the class?
  #
  # State Changes:
  # Sets @total_cost, @tip_percentage and @group_num
  
  def initialize(total_cost, tip_percentage=20, group_num=1)
    @total_cost = total_cost.to_f.abs
    @tip_percentage = tip_percentage.to_f.abs * 0.01
    @group_num = group_num.to_f.abs
  end

  def tip_amount
    @tip_percentage * @total_cost
  end
  
  # Public: #cost_per_person
  # Calculates the cost per person who attended based on the information provided in the initialize method.
  #
  # Parameters:
  # None
  # 
  # Returns:
  # The cost per person
  #
  # State Changes:
  # None

  def cost_per_person
    sprintf("%.02f", ((tip_amount + @total_cost) / @group_num)).to_f
  end
  
 
  # def group_num
 #    if @group_num < 1
 #      @group_num *= -@group_num
 #    end
 #  end
  



end

binding.pry 