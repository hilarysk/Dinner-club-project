require "pry"


class Checksplitter
  
  # Private?: #initialize
  # Establishes primary instance variables when you create a new instance of the class. (?)
  #
  # Parameters:
  # @total_cost     - Total cost of the outing
  # @group_num      - Number of members who attended
  # @tip_percentage - Tip percentage the group wants to leave
  #
  # Returns:
  # The memory location of the new instance of the class?
  #
  # State Changes:
  # Sets @total_cost, @tip_percentage and @group_num
  
  def initialize(total_cost, tip_percentage, group_num)
    @total_cost = total_cost.to_f
    @tip_percentage = tip_percentage.to_f * 0.01
    @group_num = group_num.to_f
  end
  
  # Public: #cost_per_person
  # Calculates the cost per person based on the information provided in the initialize method.
  #
  # Parameters:
  # None
  # 
  # Returns:
  # The cost per person
  #
  # State Changes:
  # None
  
  #----------------- below: methods that are supposed to solve user input errors
  
  # def group_num
 #    if @group_num < 1
 #      @group_num *= -@group_num
 #    end
 #  end
  
  # def tip_amount
  #   if @tip_percentage < 0.01
  #     @tip_percentage = 0.20
  #   else
  #     tip_amount = sprintf("%.02f", (@tip_percentage * @total_cost)).to_f
  #   end
  # end

  def cost_per_person
    sprintf("%.02f", ((tip_amount + @total_cost) / @group_num)).to_f
  end
end
