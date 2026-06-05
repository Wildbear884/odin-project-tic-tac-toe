module TicTacToe
  # Games are used to play the game, store the players, and the board.
  # And play the game itself.
  class Game
    def initialize
      @players = [TicTacToe::Player.new("X"), TicTacToe::Player.new("O")]
      @board = TicTacToe::Board.new
      @start_player = starting_player
      @player_order = [@start_player, second_player]
    end

    private

    def starting_player
      player_names = @players.map(&:name)
      input = 0

      until player_names.include?(input)
        puts "Who will go first? #{player_names.join(" or ")}?"

        input = gets.chomp
      end
      input == player_names[0] ? @players[0] : @players[1]
    end

    def second_player
      @start_player == @players.first ? @players.last : @players.first
    end
  end
end
