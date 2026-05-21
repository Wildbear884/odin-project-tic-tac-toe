module TicTacToe
  # Board is how the tic tac toe boards are created.
  class Board
    def initialize
      @board = [
        %w[_ _ _],
        %w[_ _ _],
        %w[_ _ _]
      ]
    end

    def display
      @board.each do |a|
        puts "#{a[0]} #{a[1]} #{a[2]}"
      end
    end
  end
end
