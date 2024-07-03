require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/player'

RSpec.describe Game do
  let(:game) { Game.new }
  let(:board) { Board.new }
  let(:player_one) { Player.new('X') }
  let(:player_two) { Player.new('O') }

  before do
    allow(game).to receive(:gets).and_return("Enter")
    allow_any_instance_of(Board).to receive(:display_board)

    game.instance_variable_set(:@board, board)
    game.instance_variable_set(:@player_one, player_one)
    game.instance_variable_set(:@player_two, player_two)
  end

  describe '#initialize' do
    it 'initializes with a new board' do
      expect(game.instance_variable_get(:@board)).to be_an_instance_of(Board)
    end

    it 'initializes with two players' do
      expect(game.instance_variable_get(:@player_one)).to be_an_instance_of(Player)
      expect(game.instance_variable_get(:@player_two)).to be_an_instance_of(Player)
    end

    it 'initializes with turn set to 0' do
      expect(game.instance_variable_get(:@turn)).to eq(0)
    end
  end

  describe '#set_players_name' do
    it 'sets player names correctly' do
      allow(game).to receive(:prompt_for_player_name).and_return('Alice', 'Bob')

      game.set_players_name

      expect(game.instance_variable_get(:@player_one).name).to eq('Alice')
      expect(game.instance_variable_get(:@player_two).name).to eq('Bob')
    end
  end

  describe '#increment_turn' do
    it 'increments the turn counter' do
      game.increment_turn
      expect(game.instance_variable_get(:@turn)).to eq(1)
    end
  end

  describe '#player_move' do
    it 'places token on the board' do
      row = 5
      column = 3
      game.instance_variable_set(:@turn, 1)

      allow(game).to receive(:puts).and_return("Alice's turn (X)")
      allow(game).to receive(:prompt_for_column_choice).and_return(column)

      game.player_move(player_one)

      expect(board.token_at(row, column)).to eq('X')
    end
  end

  describe '#game_over?' do
    context 'when there is a winner' do
      it 'returns true and announces the winner' do
        allow(game).to receive(:puts).and_return('winner')
        allow(game).to receive(:check_for_winner).and_return(player_one)

        expect(game).to receive(:announce_winner).with(player_one)
        expect(game.game_over?).to be(true)
      end
    end

    context 'when there is a draw' do
      it 'returns true and announces a draw' do
        allow(game).to receive(:puts).and_return('draw')
        allow(game).to receive(:check_for_winner).and_return(nil)
        allow(game).to receive(:draw?).and_return(true)

        expect(game.game_over?).to be(true)
      end
    end

    context 'when there is no winner and no draw' do
      it 'returns false' do
        allow(game).to receive(:check_for_winner).and_return(nil)
        allow(game).to receive(:draw?).and_return(false)

        expect(game.game_over?).to be(false)
      end
    end
  end
end
