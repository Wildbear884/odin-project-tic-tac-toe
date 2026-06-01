module TicTacToe
  # Games are used to play the game, store the players, and the board.
  # And play the game itself.
  class Game
    def initialize
      @players = [TicTacToe::Player.new("X"), TicTacToe::Player.new("O")]
      @board = TicTacToe::Board.new
      @player_1st = starting_player
      @player_2nd = (@player_1st == @players[0] ? @players[1] : @players[0])
    end

    private

    def starting_player
      player_names = @players.map { |p| p.name.downcase }
      input = 0

      until player_names.include?(input)
        puts "Who will go first? #{@players[0].name} or #{@players[1].name}?"

        input = gets.chomp.downcase

        @player_1st = (input == player_names[0] ? @players[0] : @players[1])
      end
      @player_1st
    end
  end
end
