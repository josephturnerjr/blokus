
window.draw_board = (el, board) ->
  el.html('')
  side = board.length
  for i in [0...side]
    for j in [0...side]
      el.append("<div class='board-square color-#{board[i][j]}'></div>")

window.draw_piece = (el, piece) ->
  matrix = piece.matrix
  console.log piece, matrix
  el.html('')
  for i in [0...5]
    for j in [0...5]
      el.append("<div class='board-square color-#{if matrix[i][j] != 0 then matrix[i][j] else 'clear'}'></div>")
