
window.draw_board = (el, board) ->
  side = board.length
  for i in [0...side]
    for j in [0...side]
      el.append("<div class='board-square color-#{board[i][j]}'></div>")

window.draw_piece = (el, piece) ->
  for i in [0...5]
    for j in [0...5]
      el.append("<div class='board-square color-#{if piece[i][j] != 0 then piece[i][j] else 'clear'}'></div>")
