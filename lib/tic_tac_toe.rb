
class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
[0,1,2], # Top row
[3,4,5], # Middle row
[6,7,8], # Bottom row
[0,3,6], # Left row
[1,4,7], # Center row
[2,5,8], # Right row
[2,4,6], # Foward diagonal
[0,4,8]  # Backward diagonal
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, current_player)
  @board[index] = current_player
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn_count
  turn = 0
  @board.each do |index|
    if index == "X" || index == "O"
      turn += 1
    end
  end
  return turn
end

def current_player
  num_turns = turn_count
  if num_turns % 2 == 0
    player = "X"
  else
    player = "O"
  end
  return player
end

def turn
  puts "Please choose a number 1-9:"
  user_input = gets.chomp
  index = input_to_index(user_input)
  if valid_move?(index)
    player_token = current_player
    move(index, player_token)
    display_board
  else
    turn
  end
end




end
