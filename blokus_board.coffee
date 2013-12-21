window.draw_board = (el, board) ->
  side = board.length - 8
  for i in [0...side]
    for j in [0...side]
      el.append("<div class='board-square-#{side} color-#{board[i][j]}'></div>")
