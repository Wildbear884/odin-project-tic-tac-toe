module TicTacToe
  # Games are used to play the game, store the players, and the board.
  # And play the game itself.
  class Game
    def initialize
      @players = [TicTacToe::Player.new("X"), TicTacToe::Player.new("O")]
      @board = TicTacToe::Board.new
    end
  end
end
