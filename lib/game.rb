module TicTacToe
  # Games are used to play the game, store the players, the board, and to play
  # the game itself and declare a winner.
  class Game
    def initialize
      @players = [TicTacToe::Player.new("X"), TicTacToe::Player.new("O")]
      @board = TicTacToe::Board.new
      @start_player = starting_player
      @player_order = [@start_player, second_player]
    end

    def play
      current_player_order = @player_order.dup
      until game_over?
        current_player = current_player_order[0]
        puts "#{current_player.name}'s placement?"
        @board.place(current_player.piece)
        @board.display
        current_player_order.rotate!
      end
      @winner = current_player_order.last
      game_ending
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

    def game_over?
      @board.winner? || @board.full?
    end

    def game_ending
      puts "#{@winner.name} wins!" if @board.winner?
      puts "It's a tie!" unless @board.winner?
      puts "Thanks for playing #{@players[0].name} and #{@players[1].name}!"
    end
  end
end
