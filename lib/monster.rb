# Responsibility: manage monster data
# Collaborators: ?
class Monster
  # generate and announce a monster
  def self.spawn_monster(type)
    case type
      when 'string'
        String.new("LARGE SNOWMAN: \u2603")
      when 'array'
        Array.new(5,'ooze')
      when 'fixnum'
        100
      when 'hash'
        { :head => "dragon", :body => "huge", :tail => "spikey" }
      else
        puts "No monsters appeared."
    end
  end

  # announce monster
  def self.announce_monster(monster)
    puts "a #{monster.inspect} appears out of the shadows and attacks!"
  end
end
