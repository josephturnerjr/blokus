valid_move = (piece, position, board) ->
  return true

piece_numbers = [1, 3, 7, 35, 99, 15, 31, 47, 39, 143, 103, 1063, 167, 391, 195, 2119, 6211, 71, 2274, 2243, 4291]

make_board = (width, height) ->
  arr = ((0 for i in [0...width + 8]) for j in [0...height + 8])
  # Set no-mans land
  for i in [0...width + 8]
    for j in [0...height + 8]
      if i < 4 or j < 4 or i >= height + 4 or j >= width + 4
        arr[i][j] = -1
  return arr
  


piece_to_matrix = (piece_id, player_index) ->
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
      arr[i][j] = player_index * ((piece_id & (1<<ind))>>ind)
  return arr

rotate_piece = (piece, rotation) ->
  a = (p.slice(0) for p in piece)
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
  return a

class Game
  constructor: (nr_players, board_size) ->
    @board_size = board_size
    @nr_players = nr_players
    @current_turn = 1
    @board = make_board(board_size, board_size)
    @players = (Player(p + 1) for p in [0...nr_players])

  make_move: (player_index, piece, rotation, top, left) ->
    rotated = rotate_piece(piece, rotation)
    # Check that it is the player's turn
    if @current_turn == player_index
      player = @players[player_index - 1]
      # Check that player has piece available
      # Check that it is a valid move
      if is_valid_move(player_index, rotated, top, left, @board, player.first_move())
        add_piece_to_board(board, rotated, top, left)
        # Increment player moves
        player.add_move()
        # Increment turn counter
        @current_turn = (@current_turn) % 4 + 1
    return false

add_piece_to_board = (board, piece, top, left) ->
  for i in [0...5]
    for j in [0...5]
      if piece[i][j] != 0
        board[top + i][left + j] = piece[i][j]

is_valid_move = (player_index, piece, top, left, board, is_first_move=false) ->
  # Add the piece to board
  for i in [0...5]
    for j in [0...5]
      # Piece must not hit an existing piece
      # Piece must not overhang board edge
      if piece[i][j] != 0
        if board[top + i][left + j] != 0
          return false
  if is_first_move
    # Piece must be in player corner
    #  Corners are numbered thusly:
    #   [1 3]
    #   [4 2]
    board_size = board.length - 8
    if player_index is 1
      [x, y] = [4, 4]
    else if player_index is 2
      [x, y] = [board_size + 3, board_size + 3]
    else if player_index is 3
      [x, y] = [4, board_size + 3]
    else
      [x, y] = [board_size + 3, 4]
    r_ind = y - top
    c_ind = x - left
    if r_ind < 0 or r_ind > 5 or c_ind < 0 or c_ind > 5 or piece[r_ind][c_ind] == 0
      return false
    else
      return true
  else
    # Piece must be in contact with a player piece on a corner
    corner_contact = false
    for i in [0...5]
      for j in [0...5]
        if piece[i][j] != 0
          # Player's pieces must not touch on their sides
          for offset in [[-1, 0], [0, -1], [0, 1], [1, 0]]
            if board[top + i + offset[0]][left + j + offset[1]] == player_index
              return false
          # Each piece must touch a player piece on a corner
          for offset in [[-1, -1], [-1, 1], [1, -1], [1, 1]]
            if board[top + i + offset[0]][left + j + offset[1]] == player_index
              corner_contact = true
    return corner_contact
    

class Player
  constructor: (index) ->
    @nr_moves = 0
    @index = index
    @pieces = (piece_to_matrix(piece, index) for piece in piece_numbers)

  first_move: () ->
    return @nr_moves == 0

  add_move: () ->
    @nr_moves++
