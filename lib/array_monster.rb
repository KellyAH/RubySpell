# Responsibility: create and announce monster's arrival
# # Collaborators:

require 'faker'
require 'spicy-proton'

class ArrayMonster
  attr_reader :name, :name_string

  def initialize
    @name = create_monster_name
    @name_string = name.join(' ')
  end

  def arrival_message
    "A #{name_string} appears."
  end

  def reveal_object_message
    "Using arcane sight, you see the monster's true form is: #{name}."
  end

  private

  # create descriptive monster name full of adjectives
  def create_monster_name
    name = Faker::Games::ElderScrolls.creature

    if name.include?(' ')
      name = separate_paired_name(name)
      [Spicy::Proton.adjective, Spicy::Proton.adjective].concat(name)
    else
      [Spicy::Proton.adjective, Spicy::Proton.adjective, name]
    end
  end
  # handle when Faker generates a monster name containing 2 or more words E.g. "Sabre Cat" or "Draugr Death Overlord"
  # turns string into an array and returns it
  def separate_paired_name(name)
    name.split
  end
end