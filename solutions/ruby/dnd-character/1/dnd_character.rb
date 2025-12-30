=begin
Write your code for the 'D&D Character' exercise in this file. Make the tests in
`dnd_character_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/dnd-character` directory.
=end

class DndCharacter
  ATTRIBUTES = %i[strength dexterity constitution intelligence wisdom charisma]
  attr_reader *ATTRIBUTES
  
  def self.modifier constitution
    ((constitution - 10) / 2).floor
  end

  def initialize
    ATTRIBUTES.each do |attr|
      results = []
      4.times { results.push(rand(1..6)) }
      value = results.sort.drop(1).sum
      instance_variable_set("@#{attr}", value)
    end
  end

  def hitpoints
    10 + DndCharacter::modifier(constitution)
  end
end
