require_relative '../lib/string_monster'
require_relative '../lib/array_monster'
require_relative '../lib/hash_monster'
require_relative '../lib/user_input'

describe UserInput do
  describe '#valid_spell?' do
    context 'a unique string object method is passed' do
      it 'returns true only for string objects' do
        s_monster = StringMonster.new
        a_monster = ArrayMonster.new
        h_monster = HashMonster.new
        user_input = UserInput.new
        user_input

        # TODO: stub / mock ? gets and chomp calls to simulate user's input
        # https://stackoverflow.com/questions/29323771/rspec-test-for-a-method-that-contains-gets-chomp
        # https://gist.github.com/Kotauror/6993000de0c53206a96879515438950d
        # https://stackoverflow.com/questions/37329190/using-rspec-to-test-user-input-with-gets

        expect(user_input.valid_spell?(s_monster)).to eq(true)
        expect(user_input.valid_spell?(a_monster)).to eq(false)
        expect(user_input.valid_spell?(h_monster)).to eq(false)
      end
    end
  end
end