require "pry"
require_relative "checksplitter_v2"
require_relative "person_class"

# Class: DiningClub
#
# Creates groups of diners who eat food and pay for it and stuff. 
#
# Attributes:
# @members    - Hash: holds the members' names and balances.
# @outings    - Hash: contains the restaurant names and names of members who attended each outing.
# 
#
# Public Methods:
# #add_member
# #show_members
# #remove_member
# #add_outing
# #record_attendance_at_outing
# #pay_for_an_outing
# #show_outings
# #get_member_balance



class DiningClub

  # Private?: #initialize
  # Establishes primary instance variables when you create a new instance of the class.
  #
  # Parameters:
  # None
  #
  # Returns:
  # Two empty hashes
  #
  # State Changes:
  # Sets @members and @outings.

  def initialize
    @members = {}
    @outings = {}
  end
  
  # Public: #add_member
  # Adds a key-value pair to hash @members where the key is the member's name (string) and the value is an instantiation
  # of class Person containing the attributes @name and @spending_amount.
  #
  # Parameters:
  # member_name - Name of the member and the value of @name
  #
  # Returns:
  # The @members hash
  #
  # State Changes:
  # Adds a key-value pair to the hash @members.
  
  def add_member(member)
    @members[member] = Person.new(member)   
    @members                              
  end                                     
 
  # Public: #show_members
  # Iterates through the @members hash and outputs each key-value pair to the console.
  #
  # Parameters:
  # None
  #
  # Returns:
  # The @members hash
  #
  # State Changes:
  # None
 
  def show_members
    @members.each do |member, person|
      puts member
    end
    @members
  end
  
  # Public: #delete_member
  # Removes the specified key ("member") from the hash @members, effectively removing the value, too. 
  #
  # Parameters:
  # member - the name of the member you wish to remove from the hash @members
  #
  # Returns:
  # The @members hash
  #
  # State Changes:
  # Removes a key-value pair from the hash @members
  
  def remove_member(member)
    @members.delete(member) #amount (the value for key "member") automatically dies when the key is deleted
    @members
  end 
  
  # Public: #record_attendance_at_outing
  # Populates the @outings hash with key-value pairs representing where the club ate and who attended; if someone attends
  # who is not part of the @members hash, they are added to the hash.
  #
  # Parameters:
  # restaurant   - Name of the restaurant where the outing took place
  # *member_name - Name(s) of members who attended the outing
  # 
  # Returns:
  # @outings 
  #
  # State Changes:
  # Adds a hash to the @outing hash; possibly adds a member-Person.new to the @members hash.
  
  def record_attendance_at_outing(restaurant, *attendees) #need to make it so if not a member already is added to hash
      @outings[restaurant] = attendees
  
      @outings.each do |restaurant, attendees|
        attendees.each do |person|
          unless @members.has_key?(person)
            @members[person] = Person.new(person)
          end
        end
      end 
  end
  
  # Public: #pay_for_an_outing
  # Incorporates class Checksplitter to determine how much each attendee at an event pays; this is then added to their 
  # @spending_amount in the @members hash. 
  #
  # Parameters:
  # total       - Total cost of the outing
  # tip         - Tip percentage the group wants to leave
  # *diners     - Names of members who attended
  # 
  # Returns:
  # @members hash
  #
  # State Changes:
  # Changes value of @spending_amount for certain pairs in the hash @members
  
  def pay_for_an_outing(total, tip, *diners) #splat argument becomes array named whatever splat is called on
    cs = Checksplitter.new(total, tip, diners.length) #counts number of strings in the splat argument
    cost_per_person = cs.cost_per_person
    
    diners.each do |diner|
      if @members.has_key?(diner) #goes through diners hash and looks for key name that == individual string
        p = @members[diner]
        p.spend(cost_per_person) #need this so that wil add any member not already in hash
      else
        add_member(diner) #need this so that will add any member not already in hash
        p = @members[diner]
        p.spend(cost_per_person) 
      end
    end
    @members
  end
  
  # Public: #show_outings
  # Iterates through the @outings hash and outputs each key-value pair to the console to show who all attended which 
  # outings.
  #
  # Parameters:
  # None
  #
  # Returns:
  # @outings hash
  #
  # State Changes:
  # None
  
  def show_outings
    @outings.each do |restaurant, attendees|
      puts "#{restaurant}: #{attendees}" 
    end
    @outings
  end
  
  # Public: #get_member_balance
  # Looks up the @spending_amount total for a specific member 
  #
  # Parameters:
  # member - person who's balance you want to know
  # 
  # Returns:
  # The member's @spending_amount 
  #
  # State Changes:
  # None
  
  def get_member_balance(member)
    @members[member].spend(0)
  end                 
  
end



omaha_club = DiningClub.new
omaha_club.add_member("Batman") # ==> @members = {"Batman" => @name="Batman", @spending_amount=0}

puts omaha_club.get_member_balance("Batman")

binding.pry  