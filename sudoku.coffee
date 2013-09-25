# Sudoku solver in CoffeeScript inspired by
# http://www.cs.mcgill.ca/~aassaf9/python/algorithm_x.html
# Stefan Baumann
# 22 September 2013

ExactCover = require './exactcover'

carthesianProduct = (vs...) ->
  if vs.length is 1
    vs[0]
  else
    cp = []
    for v in vs[0]
      for rs in carthesianProduct vs[1..-1]...
        cp.push [v].concat rs
    cp

inX = (n) ->
  xs = []
  xs = xs.concat _s for _s in [
    [ ['rc'], [0...n], [0...n] ]
    [ ['rn'], [0...n], [1..n]  ]
    [ ['cn'], [0...n], [1..n]  ]
    [ ['bn'], [0...n], [1..n]  ]
  ].map (vs) -> carthesianProduct vs...
  xs

inY = (r, c) ->
  [n, ys] = [r*c, {}]
  for bs in carthesianProduct [0...n], [0...n], [1..n]
    b = Math.floor(bs[0] / r) * r + Math.floor(bs[1] / c)
    ys[bs] = [
      ['rc', bs[0..1]]
      ['rn', [bs[0],bs[2]]]
      ['cn', bs[1..2]]
      ['bn', [b, bs[2]]]
    ]
  ys

formatSudoku = (r, c, gs) ->
  d = [1..2*c*(r+1)+1].map((i) -> '-').join('') + "\n"
  l = ""
  for k in [0...r*c]
    l += d if k%c is 0
    l += "| "
    l += [0...c].map((i) -> gs[k][c*i..c*i+r-1].join ' ').join " | "
    l += " |\n"
  l += d

solveSudoku = (r, c, gs) ->
  xc = new ExactCover inX(r*c), inY r, c
  for ns, i in gs
    for n, j in ns
      xc.select [i, j, n] unless n is 0
  for bs in xc.solve().map( (s) -> (parseInt i, 10 for i in s.split ',') )
    gs[bs[0]][bs[1]] = bs[2]
  gs

if global?
  global.solveSudoku = solveSudoku
  global.formatSudoku = formatSudoku
