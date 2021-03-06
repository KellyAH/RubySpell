# Responsibility: create a monster with a name of object type string and announce monster's arrival
# # Collaborators:

require 'faker'
require 'spicy-proton'

class StringMonster
  attr_reader :name
  attr_accessor :monster

  def initialize(type, format=nil)
    @monster = create_monster(type, format)
    @name = monster
  end

  def arrival_message
    "A #{name} appears."
  end

  ##
  # NOTE:
  # Faker's generates a random monster name (which is also the monster itself).
  # it could be 1 word "dog", or multiple words "Falmer Nightprowler", "Dire Falmer Nightprowler""
  # some spell methods (E.g. split) only look good on strings containing multiple words

  ##
  # Produces a monster name containing one or many words
  # @params [type] can be :single or :many or :random
  #
  # @return [String]
  #
  # @example
  #   create_name(:single) #=> "Argonian"
  #   create_name(:multi) #=> "Shy Argonian"
  def create_monster(type, format=nil)
    created_name = case type
           when :single
             create_single_name
           when :multi
             create_multi_name
           when :random
             create_random_name
           else
             raise StandardError, "Invalid paramater [type], Expected :single or :multi or :random."
           end

    # TODO: pull this out into seperate method
    if format != nil
      case format
      when :all_uppercase
        created_name.upcase!
      when :all_lowercase
        created_name.downcase!
      else
        raise StandardError, "Invalid paramater [format], Expected :all_uppercase or :all_lowercase."
      end
    end

    created_name
  end

  private

  ##
  # Produces a monster name containing one word
  #
  # @return [String]
  #
  # @example
  #   create_single_name #=> "Ghost"
  #
  # if auto generated base name contains more than 1 word, the last word is returned
  def create_single_name
    base_name = String.new(Faker::Games::ElderScrolls.creature)
    if base_name.split.size >= 1
      base_name.split.last
    else
      return base_name
    end
  end

  ##
  # Produces a monster name containing many words
  #
  # @return [String]
  #
  # @example
  #   create_multi_name #=> "Shy Bear"
  #
  # if auto generated base name contains only 1 word, an adjective is added to the front
  def create_multi_name
    base_name = String.new(Faker::Games::ElderScrolls.creature)
    if base_name.split.size == 1
      adjective = Spicy::Proton.adjective.capitalize
      new_name = base_name.split.unshift(adjective)
      new_name.join(' ')
    else
      return base_name
    end
  end

  ##
  # Produces a monster name containing one or many words
  #
  # @return [String]
  #
  # @example
  #   create_random_name #=> "Ghost"
  #   create_random_name #=> "Dire Wolf"
  #   create_random_name #=> "Greater Dire Wraith"
  #
  # if auto generated base name contains more than 1 word, the last word is returned
  def create_random_name
    String.new(Faker::Games::ElderScrolls.creature)
  end
end