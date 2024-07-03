require_relative '../lib/board'

describe Board do
  let(:board) { Board.new }

  before do
    allow_any_instance_of(Board).to receive(:empty_token).and_return('○')
  end

  describe '#token_at' do
    it 'returns the token at specified position' do
      expect(board.token_at(0, 0)).to eq('○')
    end
  end

  describe '#column_not_full?' do
    context 'when column is not full' do
      it 'returns true' do
        expect(board.column_not_full?(0)).to be(true)
      end
    end

    context 'when column is full' do
      before do
        6.times { board.place_token(0, 'X') }
      end

      it 'returns false' do
        expect(board.column_not_full?(0)).to be(false)
      end
    end
  end

  describe '#place_token' do
    it 'places token in the correct position' do
      board.place_token(0, 'X')
      expect(board.token_at(5, 0)).to eq('X')
    end
  end

  describe '#winning_move?' do
    context 'when there is a horizontal winning move' do
      before do
        (0..3).each { |col| board.place_token(col, 'X') }
      end

      it 'returns true' do
        expect(board.winning_move?('X')).to be(true)
      end
    end

    context 'when there is no winning move' do
      it 'returns false' do
        expect(board.winning_move?('X')).to be(false)
      end
    end
  end
end
