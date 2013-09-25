# Solve a Sudoku from http://websudoku.com
# Stefan Baumann
# 25 September 2013

http = require 'http'
require './sudoku'

class WebSudoku
  constructor: (@id, @lv) ->
    @ws = ((0 for i in [1..9]) for j in [1..9])
    @url = "http://show.websudoku.com/?level=#{@level()}&set_id=#{@id}"
    @got = false
  getSolution: (cb) ->
    http.get @url, (r) =>
      r.on 'data', (data) => @parse data
      r.on 'end', => @got = yes and cb @solve()
  gotSudoku: -> @got
  solve: -> formatSudoku 3, 3, solveSudoku 3, 3, @ws
  parse: (d) ->
    rx = /VALUE="(\d)"\s+ID=f(\d\d)/g
    while (m = rx.exec d)?
      [i, j] = (parseInt z, 10 for z in m[2].split('').reverse())
      @ws[i][j] = parseInt m[1], 10
  level: -> {Easy: 1, Medium: 2; Hard: 3, Evil: 4}[@lv]

module?.exports = WebSudoku
