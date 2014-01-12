valid_move = (piece, position, board) ->
  return true

pieces = [
 [[0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0]
  [0, 0, 1, 0, 0]
  [0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0]],
 [[0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0]
  [0, 0, 1, 1, 0]
  [0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0]],
 [[0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0]
  [0, 1, 1, 1, 0]
  [0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0]],
 [[0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0]
  [0, 0, 1, 1, 0]
  [0, 0, 1, 0, 0]
  [0, 0, 0, 0, 0]],
 [[0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0]
  [0, 0, 1, 1, 0]
  [0, 0, 1, 1, 0]
  [0, 0, 0, 0, 0]],
 [[0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0]
  [0, 1, 1, 1, 1]
  [0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0]],
 [[0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0]
  [1, 1, 1, 1, 1]
  [0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0]],
 [[0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0]
  [0, 1, 1, 1, 1]
  [0, 1, 0, 0, 0]
  [0, 0, 0, 0, 0]],
 [[0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0]
  [0, 1, 1, 1, 0]
  [0, 1, 0, 0, 0]
  [0, 0, 0, 0, 0]],
 [[0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0]
  [1, 1, 1, 1, 0]
  [0, 0, 1, 0, 0]
  [0, 0, 0, 0, 0]],
 [[0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0]
  [0, 1, 1, 1, 0]
  [0, 1, 1, 0, 0]
  [0, 0, 0, 0, 0]],
 [[0, 0, 0, 0, 0]
  [0, 1, 1, 1, 0]
  [0, 1, 0, 0, 0]
  [0, 1, 0, 0, 0]
  [0, 0, 0, 0, 0]],
 [[0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0]
  [0, 1, 1, 1, 0]
  [0, 1, 0, 1, 0]
  [0, 0, 0, 0, 0]],
 [[0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0]
  [1, 1, 1, 0, 0]
  [0, 0, 1, 1, 0]
  [0, 0, 0, 0, 0]],
 [[0, 0, 0, 0, 0]
  [0, 1, 1, 0, 0]
  [0, 0, 1, 1, 0]
  [0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0]],
 [[0, 0, 0, 0, 0]
  [0, 1, 1, 1, 0]
  [0, 0, 1, 0, 0]
  [0, 0, 1, 0, 0]
  [0, 0, 0, 0, 0]],
 [[0, 0, 0, 0, 0]
  [0, 1, 1, 0, 0]
  [0, 0, 1, 0, 0]
  [0, 0, 1, 1, 0]
  [0, 0, 0, 0, 0]],
 [[0, 0, 0, 0, 0]
  [0, 0, 0, 0, 0]
  [0, 1, 1, 1, 0]
  [0, 0, 1, 0, 0]
  [0, 0, 0, 0, 0]],
 [[0, 0, 0, 0, 0]
  [0, 0, 1, 0, 0]
  [0, 1, 1, 1, 0]
  [0, 0, 1, 0, 0]
  [0, 0, 0, 0, 0]],
 [[0, 0, 0, 0, 0]
  [0, 1, 1, 0, 0]
  [0, 0, 1, 1, 0]
  [0, 0, 1, 0, 0]
  [0, 0, 0, 0, 0]],
 [[0, 0, 0, 0, 0]
  [0, 1, 1, 0, 0]
  [0, 0, 1, 1, 0]
  [0, 0, 0, 1, 0]
  [0, 0, 0, 0, 0]]
]

make_board = (width, height) ->
  arr = ((0 for i in [0...width + 8]) for j in [0...height + 8])
  # Set no-mans land
  for i in [0...width + 8]
    for j in [0...height + 8]
      if i < 4 or j < 4 or i >= height + 4 or j >= width + 4
        arr[i][j] = -1
  return arr
  


add_piece_to_board = (board, piece, top, left) ->
  matrix = piece.matrix
  for i in [0...5]
    for j in [0...5]
      if matrix[i][j] != 0
        board[top + i][left + j] = matrix[i][j]

get_player_corner = (player_index, board_size) ->
    if player_index is 1
      return [4, 4]
    else if player_index is 2
      return [board_size + 3, board_size + 3]
    else if player_index is 3
      return [4, board_size + 3]
    else
      return [board_size + 3, 4]

is_valid_move = (player_index, piece, top, left, board, is_first_move=false) ->
  matrix = piece.matrix 
  for i in [0...5]
    for j in [0...5]
      # Piece must not hit an existing piece
      # Piece must not overhang board edge
      if matrix[i][j] != 0
        if board[top + i][left + j] != 0
          return false
  if is_first_move
    # Piece must be in player corner
    #  Corners are numbered thusly:
    #   [1 3]
    #   [4 2]
    board_size = board.length - 8
    [x, y] = get_player_corner(player_index, board_size)
    r_ind = y - top
    c_ind = x - left
    console.log(x, y, r_ind, c_ind)
    if r_ind < 0 or r_ind > 4 or c_ind < 0 or c_ind > 4 or matrix[r_ind][c_ind] == 0
      return false
    else
      return true
  else
    # Piece must be in contact with a player piece on a corner
    corner_contact = false
    for i in [0...5]
      for j in [0...5]
        if matrix[i][j] != 0
          # Player's pieces must not touch on their sides
          for offset in [[-1, 0], [0, -1], [0, 1], [1, 0]]
            if board[top + i + offset[0]][left + j + offset[1]] == player_index
              return false
          # Each piece must touch a player piece on a corner
          for offset in [[-1, -1], [-1, 1], [1, -1], [1, 1]]
            if board[top + i + offset[0]][left + j + offset[1]] == player_index
              corner_contact = true
    return corner_contact


class Game
  constructor: (nr_players, board_size) ->
    @board_size = board_size
    @nr_players = nr_players
    @current_turn = 1
    @board = make_board(board_size, board_size)
    @players = (new Player(this, p + 1) for p in [0...nr_players])

  make_move: (player_index, piece, rotation, top, left) ->
    # Check that it is the player's turn
    if @current_turn == player_index
      player = @players[player_index - 1]
      # Check that player has piece available
      # Check that it is a valid move
      if is_valid_move(player_index, piece, top, left, @board, player.first_move())
        add_piece_to_board(@board, piece, top, left)
        # Increment player moves
        player.add_move()
        # Increment turn counter
        @current_turn = (@current_turn % @nr_players) + 1
        return true
    return false
  
  get_current_player: () ->
    return @players[@current_turn - 1]


class Player
  constructor: (game, index) ->
    @game = game
    @nr_moves = 0
    @index = index
    @pieces = (new Piece(piece, @index) for piece in pieces)

  first_move: () ->
    return @nr_moves == 0

  make_move: (piece_index, rotation, top, left) ->
    valid = @game.make_move(@index, @pieces[piece_index], rotation, top, left)
    if valid
      @pieces.splice(piece_index, 1)
    return valid

  add_move: () ->
    @nr_moves++

class Piece
  constructor: (piece, player_index) ->
    arr = [
      [0, 0, 0, 0, 0] 
      [0, 0, 0, 0, 0] 
      [0, 0, 0, 0, 0] 
      [0, 0, 0, 0, 0] 
      [0, 0, 0, 0, 0] 
    ]
    for i in [0...5]
      for j in [0...5]
        ind = i * 5 + j
        arr[i][j] = player_index * piece[i][j]
    @matrix = arr

  rotate: (rotation) ->
    a = @matrix
    # Rotation = [0, 3] = number of CW 90-deg turns
    for i in [0...rotation]
      # This is taken from http://algorithmstuff.wordpress.com/2013/06/15/rotate-a-matrix-by-90-degrees/
      layers = a.length / 2
      length = a.length - 1
      for layer in [0...layers] #for each layer
          for i in [layer...length-layer] # loop through the elements we need to change at each layer
              temp = a[layer][i] #save the top eleaent, it takes just one variable as extra aeaory
              #Left -> Top
              a[layer][i] = a[length - i][layer]
              #Bottoa -> left
              a[length - i][layer] = a[length - layer][length - i]
              #Right -> bottoa
              a[length - layer][length - i] = a[i][length - layer]
              #Top -> Right
              a[i][length - layer] = temp

  flip: (rotation) ->
    a = @matrix
    for row in a
      row.reverse()


window.BlokusGame = Game
window.is_valid_move = is_valid_move
