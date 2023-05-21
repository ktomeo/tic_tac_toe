# shows text for various outcomes
module Text
  def do_again
    puts 'please select an empty field between 0 and 8!'
  end

  def draw_result
    puts show_board
    puts "it's a draw!"
  end
end

# shows current status of the board and win conditions
module Board
  def show_board
    board_display = board.each_slice(3).to_a
    puts board_display[0].join('|')
    puts board_display[1].join('|')
    puts board_display[2].join('|')
  end

  def win_condition
    @board[0, 3] == ['X', 'X', 'X'] 
  end
end

# handles inputs and switching players
module PlayerTurn
  def player_1_turn
    puts "#{@player1}, it's your turn!"
    @player_1_move = gets.chomp.to_i
    if @board[@player_1_move].to_s != '_'
      do_again
    else
      @board[@player_1_move] = 'X'
      @turn += 1
    end
  end

  def player_2_turn
    puts "#{@player2}, it's your turn!"
    @player_2_move = gets.chomp.to_i
    if @board[@player_2_move].to_s != '_'
      do_again
    else
      @board[@player_2_move] = 'O'
      @turn += 1
    end
  end
end

# main game function
class PlayGame
  include Text
  include Board
  include PlayerTurn

  attr_accessor :board, :player1, :player2, :player_1_move, :player_2_move, :turn

  def initialize()
    puts 'player 1 name?'
    @player1 = gets.chomp
    puts 'player 2 name?'
    @player2 = gets.chomp
    @board = ['_', '_', '_', '_', '_', '_', '_', '_', '_', ]
    @player_1_move = nil
    @player_2_move = nil
    @turn = 0
  end

  def start_game
    until win_condition
      puts show_board
      if @turn == 9
        draw_result
        break
      elsif turn.even?
        player_1_turn
      elsif turn.odd?
        player_2_turn
      end
    end
    puts show_board
  end
end

new_game = PlayGame.new
new_game.start_game
